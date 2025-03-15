cask "calendr" do
  version "1.16.0"
  sha256 "9ada403c1f4374737d4366abff258b992a6ad1d4720eede47beea46c24d63cf0"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  app "Calendr.app"
end
