cask "calendr" do
  version "1.16.7"
  sha256 "d2066a62b1f97f3219f302011aa767231d0ef6bec47d6eae55ba08f3464ec831"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  app "Calendr.app"
end
