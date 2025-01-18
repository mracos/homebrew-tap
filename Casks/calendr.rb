cask "calendr" do
  version "1.15.5"
  sha256 "8168b6bfdc9e19b3042d99e5a903949c8db40312a9e18fc8ccb6cf4b361b88a8"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  app "Calendr.app"
end
