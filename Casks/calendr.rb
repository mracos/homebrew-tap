cask "calendr" do
  version "1.20.3"
  sha256 "9776446115b8ff5efe0f1ac56ca2cf1a467e71edd2b34eb264161be150c677e6"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  depends_on macos: ">= :sonoma"

  app "Calendr.app"
end
