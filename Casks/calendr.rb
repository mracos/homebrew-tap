cask "calendr" do
  version "1.15.9"
  sha256 "c6ae4045dbc017d4dec6225a0a6f253aece01400dfa88c69307059a07f55a6a4"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  app "Calendr.app"
end
