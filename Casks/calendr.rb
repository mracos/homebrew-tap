cask "calendr" do
  version "1.17.9"
  sha256 "401e7d2698c8fbfaa5f90f935b9b1b5288a9e2808c99f4c9b2ec7a74fc2f0754"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  app "Calendr.app"
end
