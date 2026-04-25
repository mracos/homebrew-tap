cask "ghost-pepper" do
  version "2.3.0"
  sha256 "d7c508f70b00cc518dfd40e875fbcfd8666d1dbb6086fb3e3c2159aafa223979"

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
