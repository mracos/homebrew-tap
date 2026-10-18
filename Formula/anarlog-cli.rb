class AnarlogCli < Formula
  desc "CLI and local MCP server for Anarlog meeting notes"
  homepage "https://github.com/fastrepl/anarlog"
  version "1.4.30"
  license "MIT"

  # Upstream ships no standalone CLI build yet; the signed `anarlog-cli` sidecar
  # is lifted out of the desktop DMG, so it always matches that app release.
  # The build sandbox cannot mount a DMG (hdiutil: Device not configured), so
  # 7-Zip reads the HFS+ image instead.
  if Hardware::CPU.arm?
    url "https://github.com/fastrepl/anarlog/releases/download/desktop_v#{version}/anarlog-macos-aarch64.dmg",
        using: :nounzip
    sha256 "6fc6b87c1a9c3b4b51993c2013ca68521ce8c0906836ff07255d62c0fb743759"
  end
  if Hardware::CPU.intel?
    url "https://github.com/fastrepl/anarlog/releases/download/desktop_v#{version}/anarlog-macos-x86_64.dmg",
        using: :nounzip
    sha256 "f32214c06c64e508472d942e63a61c74a6688f95d4f671f0f39b10151819df1e"
  end

  livecheck do
    url :stable
    regex(/^desktop[._-]v?(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  depends_on "sevenzip" => :build
  depends_on macos: :sequoia

  def install
    sidecar = "Anarlog/Anarlog.app/Contents/MacOS/anarlog-cli"
    system "7zz", "x", "-y", "-o#{buildpath}", Dir["*.dmg"].first, sidecar
    bin.install sidecar => "anarlog"
  end

  def caveats
    <<~EOS
      The CLI reads the database the Anarlog app creates, so install and open
      the app once (brew install --cask anarlog).

      The app also copies its own CLI to ~/.local/bin/anarlog on launch; whichever
      comes first on PATH wins.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/anarlog --version")
    output = shell_output("#{bin}/anarlog --json --db-path #{testpath}/missing.db doctor", 1)
    assert_equal false, JSON.parse(output)["data"]["ready"]
  end
end
