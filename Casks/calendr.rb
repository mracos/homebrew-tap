cask "calendr" do
  version "1.17.1"
  sha256 "fc742b537d97fea981cbbd6ce5b15026bab76745c90e50b4c1716a7ba8bbc094"

  url "https://github.com/pakerwreah/Calendr/releases/download/v#{version}/Calendr.zip"
  name "Calendr.app"
  homepage "https://github.com/pakerwreah/Calendr"

  livecheck do
    url "https://github.com/pakerwreah/Calendr"
    strategy :github_releases
  end

  app "Calendr.app"
end
