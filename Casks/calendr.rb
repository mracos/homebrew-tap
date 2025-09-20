cask "calendr" do
  version "1.17.6"
  sha256 "8166e39dde1c8af0c5c1eda992edfe0eb663bd62f0e6134b123390c558ac14b4"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  app "Calendr.app"
end
