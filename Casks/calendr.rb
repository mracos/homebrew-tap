cask "calendr" do
  version "1.15.2"
  sha256 "a057757abf5a759ffb0f150569569f592c642fa60d954b6df4d9c4dae820456d"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  app "Calendr.app"
end
