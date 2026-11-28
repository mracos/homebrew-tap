cask "heyclicky" do
  version "1.1.7"
  sha256 "8b1a05b4d41b7921ec6ae63777e6a105350cf2cbb9f1f54d0d833a3c13f37599"

  url "https://github.com/farzaa/clicky-releases/releases/download/v#{version}/HeyClicky.dmg"
  name "HeyClicky"
  desc "Voice-driven AI assistant that sees the screen and performs tasks"
  homepage "https://www.heyclicky.com/"

  livecheck do
    url "https://github.com/farzaa/clicky-releases/releases/latest"
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "HeyClicky.app"

  zap trash: [
    "~/Library/Application Support/Clicky",
    "~/Library/Caches/com.humansongs.clicky",
    "~/Library/HTTPStorages/com.humansongs.clicky",
    "~/Library/Preferences/com.humansongs.clicky.plist",
    "~/Library/Saved Application State/com.humansongs.clicky.savedState",
  ]
end
