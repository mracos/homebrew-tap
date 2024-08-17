cask "calendr" do
  version "1.12.1"
  sha256 "4d936be0e410a405cad336e94aecbd356cbdcd4dbd81b3c2229bd5065354ea4f"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  app "Calendr.app"
end
