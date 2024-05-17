cask "calendr" do
  version "1.11.0"
  sha256 "3f587c21596ad64d51cb3ca0c3e4eb7cb326f428f89af5ceaff38a05410141f3"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  app "Calendr.app"
end
