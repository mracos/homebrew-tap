cask "calendr" do
  version "1.16.8"
  sha256 "a6760d591b740dcad5df44088508f5740efbff1cea405cce51479357427eabfb"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  app "Calendr.app"
end
