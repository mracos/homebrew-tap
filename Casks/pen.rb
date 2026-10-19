cask "pen" do
  arch arm: "arm64", intel: "x64"

  version "1.2.18"
  sha256 arm:   "3113866f58d4fa6359491f685fdca430ca1669819c3e9613ecf72f55bd214b22",
         intel: "e18272a04388b2c8449a9a2eee0e86a4810dff48fa4aa1a8b9b1863fe056ec5b"

  url "https://github.com/highagency/pen-desktop-releases/releases/download/v#{version}/Pen-#{version}-mac-#{arch}.dmg",
      verified: "github.com/highagency/pen-desktop-releases/"
  name "pen.dev"
  desc "Design tool with .pen files and AI agent integration"
  homepage "https://www.pen.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

  app "Pen.app"

  zap trash: [
    "~/Library/Application Support/Pen",
    "~/Library/Caches/dev.pencil.desktop",
    "~/Library/Caches/dev.pencil.desktop.ShipIt",
    "~/Library/Caches/pen-updater",
    "~/Library/HTTPStorages/dev.pencil.desktop",
    "~/Library/Logs/Pen",
    "~/Library/Preferences/dev.pencil.desktop.plist",
    "~/Library/Saved Application State/dev.pencil.desktop.savedState",
  ]
end
