cask "calendr" do
  version "1.15.6"
  sha256 "01aa0417ad88b70e9cd68cd9eda98f6efb9f9d969844091e1b6cea2081d24329"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  app "Calendr.app"
end
