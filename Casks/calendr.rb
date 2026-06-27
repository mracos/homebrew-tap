cask "calendr" do
  version "1.22.1"
  sha256 "2c614ecb0e98f88e46189b94de2584961576a01f825db07284c507c62073227c"

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
