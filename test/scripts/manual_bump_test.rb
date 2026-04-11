# frozen_string_literal: true

require "minitest/autorun"
require_relative "../../scripts/manual-bump"

class ManualBumpTest < Minitest::Test
  FAKE_SHA = "a" * 64
  OLD_SHA = "b" * 64

  def bumper(content, new_version:, old_sha: OLD_SHA)
    file = Tempfile.new(["test-formula", ".rb"])
    file.write(content)
    file.close

    downloader = ->(_url) { FAKE_SHA }
    mb = ManualBump.new(file: file.path, new_version: new_version, downloader: downloader)
    [mb, file]
  ensure
    # caller must close file after reading result
  end

  def bump(content, new_version:)
    mb, file = bumper(content, new_version: new_version)
    mb.run
    result = File.read(file.path)
    file.unlink
    result
  end

  # --- Version line ---

  def test_updates_simple_version
    content = <<~RUBY
      class Gws < Formula
        version "1.0.0"
      end
    RUBY

    result = bump(content, new_version: "2.0.0")

    assert_includes result, 'version "2.0.0"'
    refute_includes result, 'version "1.0.0"'
  end

  def test_updates_comma_separated_version
    content = <<~RUBY
      class Aseprite < Formula
        version "1.3.16,1.3.16.1"
      end
    RUBY

    result = bump(content, new_version: "1.3.17,1.3.17")

    assert_includes result, 'version "1.3.17,1.3.17"'
    refute_includes result, 'version "1.3.16,1.3.16.1"'
  end

  def test_raises_when_no_version_found
    content = <<~RUBY
      class Foo < Formula
        url "https://example.com/foo.tar.gz"
      end
    RUBY

    mb, file = bumper(content, new_version: "1.0.0")
    assert_raises(RuntimeError) { mb.run }
    file.unlink
  end

  # --- URL resolution: literal version ---

  def test_replaces_literal_version_in_url
    content = <<~RUBY
      class Gws < Formula
        version "1.0.0"
        url "https://example.com/releases/v1.0.0/app.tar.gz"
        sha256 "#{OLD_SHA}"
      end
    RUBY

    result = bump(content, new_version: "2.0.0")

    assert_includes result, "v2.0.0/app.tar.gz"
    refute_includes result, "v1.0.0/app.tar.gz"
  end

  # --- URL resolution: #{version} interpolation ---

  def test_preserves_version_interpolation_in_url
    content = <<~RUBY
      cask "toastty" do
        version "0.2.1"
        sha256 "#{OLD_SHA}"
        url "https://example.com/v\#{version}/App-\#{version}.dmg"
      end
    RUBY

    result = bump(content, new_version: "0.4.2")

    # URL template preserved (not resolved to literal)
    assert_includes result, '#{version}'
    refute_includes result, "0.4.2.dmg"
  end

  # --- URL resolution: split version ---

  def test_resolves_split_version_interpolation
    mb, _file = bumper("", new_version: "1.3.17,1.3.17")
    url = 'https://example.com/v#{version.to_s.split(",")[0]}/App-v#{version.to_s.split(",")[1]}.zip'

    resolved = mb.resolve_url(url, "1.3.16,1.3.16.1")

    assert_equal "https://example.com/v1.3.17/App-v1.3.17.zip", resolved
  end

  # --- SHA256: forward search (formula pattern) ---

  def test_updates_sha256_after_url_in_formula
    content = <<~RUBY
      class Gws < Formula
        version "1.0.0"
        url "https://example.com/v1.0.0/app.tar.gz"
        sha256 "#{OLD_SHA}"
      end
    RUBY

    result = bump(content, new_version: "2.0.0")

    assert_includes result, "sha256 \"#{FAKE_SHA}\""
    refute_includes result, "sha256 \"#{OLD_SHA}\""
  end

  # --- SHA256: backward search (cask pattern) ---

  def test_updates_sha256_before_url_in_cask
    content = <<~RUBY
      cask "toastty" do
        version "0.2.1"
        sha256 "#{OLD_SHA}"
        url "https://example.com/v\#{version}/App.dmg"
      end
    RUBY

    result = bump(content, new_version: "0.4.2")

    assert_includes result, "sha256 \"#{FAKE_SHA}\""
    refute_includes result, "sha256 \"#{OLD_SHA}\""
  end

  # --- Multi-arch: multiple URL/SHA pairs ---

  def test_updates_all_platform_url_sha_pairs
    content = <<~RUBY
      class Gws < Formula
        version "1.0.0"
        on_macos do
          on_arm do
            url "https://example.com/v1.0.0/app-arm64-darwin.tar.gz"
            sha256 "#{OLD_SHA}"
          end
          on_intel do
            url "https://example.com/v1.0.0/app-x86_64-darwin.tar.gz"
            sha256 "#{OLD_SHA}"
          end
        end
        on_linux do
          on_arm do
            url "https://example.com/v1.0.0/app-arm64-linux.tar.gz"
            sha256 "#{OLD_SHA}"
          end
          on_intel do
            url "https://example.com/v1.0.0/app-x86_64-linux.tar.gz"
            sha256 "#{OLD_SHA}"
          end
        end
      end
    RUBY

    # Each platform gets a unique SHA via call count
    call_count = 0
    shas = %w[1111 2222 3333 4444].map { |s| s * 16 }
    downloader = ->(_url) { shas[call_count].tap { call_count += 1 } }

    file = Tempfile.new(["multi-arch", ".rb"])
    file.write(content)
    file.close

    ManualBump.new(file: file.path, new_version: "2.0.0", downloader: downloader).run
    result = File.read(file.path)
    file.unlink

    # All 4 URLs updated
    assert_equal 0, result.scan("v1.0.0").length
    assert_equal 4, result.scan("v2.0.0").length

    # All 4 SHAs updated (each unique)
    assert_equal 0, result.scan(OLD_SHA).length
    shas.each { |sha| assert_includes result, sha }

    # Downloader called exactly 4 times
    assert_equal 4, call_count
  end

  # --- Resource blocks skipped ---

  def test_does_not_touch_resource_urls_or_shas
    resource_sha = "c" * 64
    content = <<~RUBY
      class Aseprite < Formula
        url "https://example.com/v\#{version.to_s.split(",")[0]}/Source-v\#{version.to_s.split(",")[1]}.zip"
        version "1.3.16,1.3.16.1"
        sha256 "#{OLD_SHA}"

        resource "skia" do
          on_arm do
            url "https://example.com/skia/Skia-arm64.zip"
            sha256 "#{resource_sha}"
          end
        end
      end
    RUBY

    result = bump(content, new_version: "1.3.17,1.3.17")

    # Main sha updated
    assert_includes result, "sha256 \"#{FAKE_SHA}\""

    # Resource sha untouched
    assert_includes result, "sha256 \"#{resource_sha}\""

    # URL template preserved
    assert_includes result, '#{version.to_s.split(",")[0]}'

    # Skia URL untouched
    assert_includes result, "skia/Skia-arm64.zip"
  end

  # --- :no_check handling ---

  def test_skips_download_for_no_check_sha
    content = <<~RUBY
      cask "volatile" do
        version "1.0.0"
        sha256 :no_check
        url "https://example.com/v\#{version}/app.dmg"
      end
    RUBY

    download_called = false
    downloader = ->(_url) { download_called = true; FAKE_SHA }

    file = Tempfile.new(["no-check", ".rb"])
    file.write(content)
    file.close

    ManualBump.new(file: file.path, new_version: "2.0.0", downloader: downloader).run
    result = File.read(file.path)
    file.unlink

    refute download_called, "should not download when sha256 is :no_check"
    assert_includes result, "sha256 :no_check"
    assert_includes result, 'version "2.0.0"'
  end

  # --- Error: missing sha256 ---

  def test_raises_when_sha256_not_found
    content = <<~RUBY
      class Foo < Formula
        version "1.0.0"
        url "https://example.com/v1.0.0/foo.tar.gz"
      end
    RUBY

    mb, file = bumper(content, new_version: "2.0.0")
    assert_raises(RuntimeError) { mb.run }
    file.unlink
  end

  # --- Downloader receives resolved URL ---

  def test_downloader_receives_resolved_url
    content = <<~RUBY
      class Foo < Formula
        version "1.0.0"
        url "https://example.com/v1.0.0/foo.tar.gz"
        sha256 "#{OLD_SHA}"
      end
    RUBY

    downloaded_urls = []
    downloader = ->(url) { downloaded_urls << url; FAKE_SHA }

    file = Tempfile.new(["resolved-url", ".rb"])
    file.write(content)
    file.close

    ManualBump.new(file: file.path, new_version: "2.0.0", downloader: downloader).run
    file.unlink

    assert_equal ["https://example.com/v2.0.0/foo.tar.gz"], downloaded_urls
  end
end
