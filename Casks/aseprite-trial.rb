cask "aseprite-trial" do
  version "1.3.15.4"
  sha256 "b27bbce67c6d07311290b53eb22a4e2d3ef56498484afc369661a23587fece97"

  url "https://www.aseprite.org/downloads/trial/Aseprite-v#{version}-trial-macOS.dmg"
  name "Aseprite Trial"
  desc "Animated sprite editor and pixel art tool (official trial build)"
  homepage "https://www.aseprite.org/"

  livecheck do
    url "https://www.aseprite.org/trial"
    regex(/Aseprite Trial v(\d+(?:\.\d+)+) for macOS/)
  end

  depends_on macos: ">= :big_sur"
  conflicts_with cask: "aseprite"

  auto_updates false

  app "Aseprite.app"

  zap trash: [
    "~/Library/Application Support/Aseprite",
    "~/Library/Logs/Homebrew/aseprite",
    "~/Library/Preferences/Aseprite.plist",
    "~/Library/Preferences/org.aseprite.Aseprite.plist",
    "~/Library/Saved Application State/org.aseprite.Aseprite.savedState",
  ]
end
