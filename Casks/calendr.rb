cask "calendr" do
  version "1.26.2"
  sha256 "c535ab6823f911e999f7e41ff149bfc1511229a88b58a58e49c654e76edee357"

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
