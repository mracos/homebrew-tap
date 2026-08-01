cask "ghost-pepper" do
  version "2.4.4"
  sha256 "a8c09b24ce19613bb421c0dce06e6167d738a8295f05fa5e5a363551de6b8f06"

  url "https://github.com/matthartman/ghost-pepper/releases/download/v#{version}/GhostPepper.dmg"
  name "Ghost Pepper"
  desc "Hold-to-talk speech-to-text powered by WhisperKit"
  homepage "https://github.com/matthartman/ghost-pepper"

  livecheck do
    url "https://github.com/matthartman/ghost-pepper/releases/latest"
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "GhostPepper.app"
end
