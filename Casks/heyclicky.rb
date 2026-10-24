cask "heyclicky" do
  version "1.1.1"
  sha256 "220f86a734a93015a3551e0a1b6e0684cb6dc6b0fee95f175785745a245b7fb4"

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
