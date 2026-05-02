cask "calendr" do
  version "1.20.7"
  sha256 "3f1805577540a11a2f03030eb25b9023b32925e30cc1cbc76eac253aad3c67f6"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  depends_on macos: ">= :sonoma"

  app "Calendr.app"
end
