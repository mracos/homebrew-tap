cask "calendr" do
  version "1.24.0"
  sha256 "de8aa5a478b7b88e0ac6f948b559911303d02c0bb66f6bb4a981057c749fa722"

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
