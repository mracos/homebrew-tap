cask "calendr" do
  version "1.17.8"
  sha256 "87713ff09ba0158564d240a4716b6320e429277f75a5707daeb900b4afb1ace5"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  app "Calendr.app"
end
