cask "calendr" do
  version "1.18.1"
  sha256 "b95aae632bc559d5cc8c484ac7ea60933920d4a802d4bee4ea74e46bd994f078"

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
