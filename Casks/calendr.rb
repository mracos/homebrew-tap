cask "calendr" do
  version "1.10.8"
  sha256 "f4f2983a132f6d27957cb7149b3319ca6f5d810ba868b89258c3defce0f0345e"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  app "Calendr.app"
end
