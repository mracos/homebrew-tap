cask "calendr" do
  version "1.12.3"
  sha256 "d66b9f6cb4e624856c2a87eeccc6bb526d0403e679bbfe577ae8cb618e5bc61a"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  app "Calendr.app"
end
