cask "calendr" do
  version "1.26.0"
  sha256 "642c0956fd0f169812df3aced0dcbc8ab7a861f0a017da2109400813fded0d5e"

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
