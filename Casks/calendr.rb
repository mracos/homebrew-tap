cask "calendr" do
  version "1.15.1"
  sha256 "35e48e78bd5954e0cc239a317e32cc476a10f5f50ca4ba50d543511dca85bcb4"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  app "Calendr.app"
end
