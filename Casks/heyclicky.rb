cask "heyclicky" do
  version "1.1.2"
  sha256 "fcf971872e04e111696370ade15c68f6f3812559d5f843b424bb3a7a800dcffc"

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
