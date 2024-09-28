cask "calendr" do
  version "1.13.3"
  sha256 "70739ae9dd42be3b5168c6f5c568e40f393f268d0e55c419d6b4c49a8733f8e3"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  app "Calendr.app"
end
