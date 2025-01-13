cask "calendr" do
  version "1.15.4"
  sha256 "4c37877231c82eab827d922b9fc9598bebc11ec577c774ddc6defa0f10f67a81"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  app "Calendr.app"
end
