cask "ghost-pepper" do
  version "2.4.2"
  sha256 "fbd30db478d3477db4808b489e84be90f2a678b882d3609147bbb0bc83d84aac"

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
