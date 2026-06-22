cask "calendr" do
  version "1.22.0"
  sha256 "6a1fd9204f44f3818b6c9c32db603ff753006e4d900560c9ca02854b3c4cf70e"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  depends_on macos: :sonoma

  app "Calendr.app"
end
