cask "pen" do
  arch arm: "arm64", intel: "x64"

  version "1.2.22"
  sha256 arm:   "9fcbeacb577aeb45a83ccaee864f06d0d80c02856e598fb97776c880698048af",
         intel: "baeeb1de1d2ea482f056ce40443c9188d4c57a269159aa2ba3958417ae92d67f"

  url "https://github.com/highagency/pen-desktop-releases/releases/download/v#{version}/Pen-#{version}-mac-#{arch}.dmg"
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
