cask "calendr" do
  version "1.14.0"
  sha256 "2c63fa4d7fd634a658d4de287989dd92482f617b63d070182bbd6a82fc211248"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  app "Calendr.app"
end
