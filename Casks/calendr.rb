cask "calendr" do
  version "1.16.3"
  sha256 "252d48ca1739104d1e4e16596476eb26e9a22e00cb1d5464333e983f2a9f2e66"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  app "Calendr.app"
end
