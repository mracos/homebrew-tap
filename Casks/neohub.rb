cask "neohub" do
  version "0.2.1"
  sha256 "d4dac0473a86ea9af7e055c524ea36c1a35483be52befdd24d2d67908972f6c3"

  url "https://github.com/alex35mil/NeoHub/releases/download/v#{version}/NeoHub.zip"
  name "NeoHub.app"
  homepage "https://github.com/alex35mil/NeoHub"

  livecheck do
    url "https://github.com/alex35mil/NeoHub"
    strategy :github_releases
  end

  app "NeoHub.app"
end
