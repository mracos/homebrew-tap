cask "ghost-pepper" do
  version "2.4.0"
  sha256 "2be0ea17477e62b22c0a99d307b30811e3dd24e9b6ee26ec28bc5056284f917a"

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
