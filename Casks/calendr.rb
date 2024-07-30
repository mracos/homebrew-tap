cask "calendr" do
  version "1.11.5"
  sha256 "1556a4992d0a394241c30f881302995e9f5599410ad2321a01febd9822e66f06"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  app "Calendr.app"
end
