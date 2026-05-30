cask "calendr" do
  version "1.20.8"
  sha256 "b40c4b03f4d4e29ff127522641f42c74ed200ea9763153b4b48d5b3ca22aca17"

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
