cask "calendr" do
  version "1.16.5"
  sha256 "5a872ee9f9374d0ba40e34c9e742749679397efdde454d1f2d9430dbddb8ec7b"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  app "Calendr.app"
end
