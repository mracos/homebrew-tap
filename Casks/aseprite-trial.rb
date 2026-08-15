cask "aseprite-trial" do
  version "1.3.18.2"
  sha256 "dcc3f2846876a1fa1c52000268951823026983c486dc65093bb3be6fe26f50ee"

  url "https://www.aseprite.org/downloads/trial/v#{version}/Aseprite-v#{version}-trial-macOS.dmg"
  name "Aseprite Trial"
  desc "Animated sprite editor and pixel art tool (official trial build)"
  homepage "https://www.aseprite.org/"

  livecheck do
    url "https://www.aseprite.org/trial"
    regex(/Aseprite Trial v(\d+(?:\.\d+)+) for macOS/)
  end

  auto_updates false
  conflicts_with cask: "aseprite"
  depends_on macos: :big_sur

  app "Aseprite.app"

  zap trash: [
    "~/Library/Application Support/Aseprite",
    "~/Library/Logs/Homebrew/aseprite",
    "~/Library/Preferences/Aseprite.plist",
    "~/Library/Preferences/org.aseprite.Aseprite.plist",
    "~/Library/Saved Application State/org.aseprite.Aseprite.savedState",
  ]
end
