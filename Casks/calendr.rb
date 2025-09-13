cask "calendr" do
  version "1.17.4"
  sha256 "22a546a9a059b3ae5ec8904d1eee297efd07838b18d0f49fde34773362d1d7dd"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  app "Calendr.app"
end
