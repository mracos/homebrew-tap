cask "aseprite-trial" do
  version "1.3.16.1"
  sha256 "60db63624b9fa67836e07ea3fe868149fa52de06fc02ac29beb7de5c18486250"

  url "https://www.aseprite.org/downloads/trial/Aseprite-v#{version}-trial-macOS.dmg"
  name "Aseprite Trial"
  desc "Animated sprite editor and pixel art tool (official trial build)"
  homepage "https://www.aseprite.org/"

  livecheck do
    url "https://www.aseprite.org/trial"
    regex(/Aseprite Trial v(\d+(?:\.\d+)+) for macOS/)
  end

  auto_updates false
  conflicts_with cask: "aseprite"
  depends_on macos: ">= :big_sur"

  app "Aseprite.app"

  zap trash: [
    "~/Library/Application Support/Aseprite",
    "~/Library/Logs/Homebrew/aseprite",
    "~/Library/Preferences/Aseprite.plist",
    "~/Library/Preferences/org.aseprite.Aseprite.plist",
    "~/Library/Saved Application State/org.aseprite.Aseprite.savedState",
  ]
end
