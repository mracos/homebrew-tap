cask "calendr" do
  version "1.12.4"
  sha256 "624946cc3ec111c47a6b8f2e9096840daf448495866a803d21146ad525369733"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  app "Calendr.app"
end
