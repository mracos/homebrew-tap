cask "calendr" do
  version "1.22.4"
  sha256 "116d5c9ff0a7b371db2e82ab44942ccc3e7256eff722f6c7587694941e04adc3"

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
