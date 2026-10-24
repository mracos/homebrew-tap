cask "calendr" do
  version "1.26.1"
  sha256 "386518949acfd82249fd7b192d906ad3c19d1ca6297765191edc22555fae6299"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  depends_on macos: :sequoia

  app "Calendr.app"
end
