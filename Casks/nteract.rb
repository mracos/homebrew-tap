# Shadows homebrew/cask/nteract (same token, so no conflicts_with): upstream
# ships only the app bundle, this adds the bundled CLIs to PATH. Install
# fully-qualified once (`brew install mracos/tap/nteract`); upgrades then
# track this tap.
cask "nteract" do
  version "2.11.0-stable.202611261702"
  sha256 "c71b02f3df97cfa75e5337a16c264e398430a89785e95981a13c3688225f4ece"

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
  depends_on :macos

  app "nteract.app"
  # Upstream cask ships only the app; these CLIs live inside the bundle and
  # never reach PATH. The mcp daemon needs `runt` resolvable (its absence
  # crash-looped the nteract MCP proxy for 3 months).
  binary "#{appdir}/nteract.app/Contents/MacOS/runt"
  binary "#{appdir}/nteract.app/Contents/MacOS/nteract-mcp"
end
