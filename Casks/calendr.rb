cask "calendr" do
  version "1.21.3"
  sha256 "482309fb509bdb71517bb0786b9e3c8ee09eef7f723c77a49524b42ddd8f00bf"

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
