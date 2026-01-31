cask "calendr" do
  version "1.20.1"
  sha256 "886003b231087ca872afcb474d97fd93257d650e37cd53a6febbfb4c6141bf6a"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  depends_on macos: ">= :sonoma"

  app "Calendr.app"
end
