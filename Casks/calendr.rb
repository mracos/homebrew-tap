cask "calendr" do
  version "1.11.7"
  sha256 "55097f588130798f5f0133195f035481758193ef3590b4b90d3e348c745ff184"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  app "Calendr.app"
end
