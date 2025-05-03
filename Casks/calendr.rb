cask "calendr" do
  version "1.16.4"
  sha256 "c4640209d97504f433c77a90b36a7a2ad1117e56dcef44be488e4e032c1236ce"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  app "Calendr.app"
end
