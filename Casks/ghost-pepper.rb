cask "ghost-pepper" do
  version "1.5.0"
  sha256 "701eacc8895944f6371ad3f77b82f70145ac9602e48e7509df189c3e14a223c9"

  url "https://github.com/matthartman/ghost-pepper/releases/download/v#{version}/GhostPepper.dmg"
  name "Ghost Pepper"
  desc "Hold-to-talk speech-to-text powered by WhisperKit"
  homepage "https://github.com/matthartman/ghost-pepper"

  livecheck do
    url "https://github.com/matthartman/ghost-pepper/releases/latest"
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "GhostPepper.app"
end
