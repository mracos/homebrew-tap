cask "heyclicky" do
  version "1.0.53"
  sha256 "a83c69ee8ec486d2cf9e257aaa39b612539f6b5544d52a4ef2caa652284bd31c"

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
