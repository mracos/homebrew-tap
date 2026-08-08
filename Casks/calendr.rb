cask "calendr" do
  version "1.23.0"
  sha256 "239099f7e873351e7cee002fdab7be16870a9d748081b41995909bf538e53a8a"

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
