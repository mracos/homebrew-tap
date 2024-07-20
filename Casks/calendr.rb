cask "calendr" do
  version "1.11.3"
  sha256 "471c83ec451ab401458af979d9a590ae023872ee8ccb678fb38ba2274ad709e0"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  app "Calendr.app"
end
