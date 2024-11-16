cask "calendr" do
  version "1.14.7"
  sha256 "9026831f7ec1d7062c9a630be5e96b5c788160578ba9a1edfa84120605eb6a11"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  app "Calendr.app"
end
