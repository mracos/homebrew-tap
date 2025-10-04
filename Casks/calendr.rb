cask "calendr" do
  version "1.17.7"
  sha256 "629a0d2a2249da8aa37fa96f4c99b2588a7ef288b87b15be11ad9ec7605654a8"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  app "Calendr.app"
end
