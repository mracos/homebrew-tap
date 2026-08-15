cask "calendr" do
  version "1.23.2"
  sha256 "eff1e3adc3e251cf65133f4607e953d19e90452582b41804483cdbe1338aae26"

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
