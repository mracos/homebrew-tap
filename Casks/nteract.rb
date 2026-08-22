# Shadows homebrew/cask/nteract (same token, so no conflicts_with): upstream
# ships only the app bundle, this adds the bundled CLIs to PATH. Install
# fully-qualified once (`brew install mracos/tap/nteract`); upgrades then
# track this tap.
cask "nteract" do
  version "2.7.1-stable.202608192148"
  sha256 "eb397ec14669e36d3cb7b4da8731e47b14575d27c5d9e655a8d65459341d8c61"

  url "https://github.com/nteract/desktop/releases/download/v#{version}/nteract-stable-darwin-arm64.dmg"
  name "nteract"
  desc "Interactive computing suite"
  homepage "https://github.com/nteract/desktop"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+-stable\.\d+)$/i)
    strategy :github_releases
  end

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "nteract.app"
  # Upstream cask ships only the app; these CLIs live inside the bundle and
  # never reach PATH. The mcp daemon needs `runt` resolvable (its absence
  # crash-looped the nteract MCP proxy for 3 months).
  binary "#{appdir}/nteract.app/Contents/MacOS/runt"
  binary "#{appdir}/nteract.app/Contents/MacOS/nteract-mcp"
end
