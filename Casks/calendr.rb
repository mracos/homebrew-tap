cask "calendr" do
  version "1.17.3"
  sha256 "ca986f48ad931db45fde576acfb7e82bae38d6ff325a4ee0735040d3feb4235a"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  app "Calendr.app"
end
