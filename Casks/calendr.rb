cask "calendr" do
  version "1.16.9"
  sha256 "5e7b790f0e867ea1f6e0eb1840a1548027d982baabf121768c5b825a96f1df56"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  app "Calendr.app"
end
