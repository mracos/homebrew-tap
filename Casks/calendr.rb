cask "calendr" do
  version "1.16.2"
  sha256 "b3da23b6644822b6bc0ba1a33a469b6ac9ccf6107adccba28ca94d8552c828ab"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  app "Calendr.app"
end
