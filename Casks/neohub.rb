cask "neohub" do
  version "0.1.1"
  sha256 "28ee22995f50075578a477b06f083fd4ea5f9e65a272f6ca355804a139ccdc84"

  url "https://github.com/alex35mil/NeoHub/releases/download/v#{version}/NeoHub.zip"
  appcast

  livecheck do
    url "https://github.com/alex35mil/NeoHub/releases.atom"
    strategy :sparkle, &:version
  end

  name "NeoHub.app"
  homepage "https://github.com/alex35mil/NeoHub"

  app "NeoHub.app"
end
