# Shadows homebrew/cask/nteract (same token, so no conflicts_with): upstream
# ships only the app bundle, this adds the bundled CLIs to PATH. Install
# fully-qualified once (`brew install mracos/tap/nteract`); upgrades then
# track this tap.
cask "nteract" do
  version "2.8.6-stable.202610150559"
  sha256 "eda3e2466237a7d504599d3b586029fe6f947e831f8d8ad562d970001e9d36cc"

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
