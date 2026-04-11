#!/usr/bin/env ruby
# frozen_string_literal: true

# Manual formula/cask bumper for when `brew bump-*-pr` can't handle the formula.
# Handles multi-arch formulas (on_macos/on_linux blocks) and split-version formulas
# (version.to_s.split).
#
# Usage: ruby scripts/manual-bump.rb <formula_file> <new_version>

require "digest"
require "tempfile"

class ManualBump
  attr_reader :file, :new_version

  def initialize(file:, new_version:, downloader: nil)
    @file = file
    @new_version = new_version
    @downloader = downloader || method(:curl_sha256)
  end

  def run
    content = File.read(file)
    result = bump(content)
    File.write(file, result)
  end

  # Pure transformation: takes file content string, returns updated content string.
  # All side effects (downloads) go through @downloader.
  def bump(content)
    lines = content.lines
    current_version = extract_version(content)

    $stderr.puts "Bumping #{File.basename(file)}: #{current_version} → #{new_version}"

    lines = update_version_line(lines, current_version)
    url_entries = find_versioned_urls(lines, current_version)

    $stderr.puts "Warning: No versioned URLs found, only updating version line" if url_entries.empty?

    url_entries.each do |entry|
      resolved = resolve_url(entry[:url], current_version)
      lines = update_url_line(lines, entry, resolved)
      lines = update_sha256(lines, entry[:index], resolved)
    end

    lines.join
  end

  def extract_version(content)
    match = content.match(/^\s*version "([^"]+)"/)
    raise "No version line found in #{file}" unless match

    match[1]
  end

  def update_version_line(lines, current_version)
    updated = false
    lines.each_with_index do |line, i|
      if !updated && line =~ /^(\s*version ")#{Regexp.escape(current_version)}(")/
        lines[i] = "#{$1}#{new_version}#{$2}\n"
        updated = true
      end
    end
    raise "Failed to update version line" unless updated

    lines
  end

  def find_versioned_urls(lines, current_version)
    entries = []
    lines.each_with_index do |line, i|
      next unless line =~ /^\s*url "(.*)"/

      url_str = $1
      next unless url_str.include?(current_version) || url_str.include?('#{version')

      entries << { index: i, url: url_str }
    end
    entries
  end

  def resolve_url(url_str, current_version)
    resolved = url_str.dup
    resolved.gsub!(current_version, new_version) if url_str.include?(current_version)
    resolved.gsub!('#{version}', new_version)

    parts = new_version.split(",")
    resolved.gsub!(/\#\{version\.to_s\.split\(","\)\[(\d+)\]\}/) { parts[Regexp.last_match(1).to_i] }
    resolved
  end

  def update_url_line(lines, entry, resolved)
    unless entry[:url].include?('#{')
      lines[entry[:index]] = lines[entry[:index]].sub(entry[:url], resolved)
    end
    lines
  end

  def update_sha256(lines, url_index, resolved_url)
    # Search backward first (cask format: sha256 before url), then forward (formula format)
    search_ranges = [
      (url_index - 1).downto(0),
      ((url_index + 1)...lines.length).each,
    ]

    search_ranges.each do |range|
      range.each do |j|
        if lines[j] =~ /^\s*sha256\s+:no_check/
          $stderr.puts "  Skipping #{resolved_url} (sha256 :no_check)"
          return lines
        end

        if lines[j] =~ /^(\s*sha256 ")[0-9a-f]{64}(")/
          sha = @downloader.call(resolved_url)
          lines[j] = "#{$1}#{sha}#{$2}\n"
          return lines
        end

        break if lines[j] =~ /^\s*(url "|end\b)/
      end
    end

    raise "Could not find sha256 for URL at line #{url_index + 1}: #{resolved_url}"
  end

  private

  def curl_sha256(url)
    tmpfile = Tempfile.new("manual-bump")
    begin
      $stderr.puts "  Downloading #{url}..."
      success = system("curl", "-fsSL", "--retry", "3", "-o", tmpfile.path, url)
      raise "Failed to download #{url}" unless success

      sha = Digest::SHA256.file(tmpfile.path).hexdigest
      $stderr.puts "  SHA256: #{sha}"
      sha
    ensure
      tmpfile.close
      tmpfile.unlink
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  file = ARGV[0]
  new_version = ARGV[1]
  abort "Usage: #{$PROGRAM_NAME} <file> <version>" unless file && new_version

  ManualBump.new(file: file, new_version: new_version).run
end
