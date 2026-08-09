cask "calendr" do
  version "1.23.1"
  sha256 "1ad354a5e843df7cd67022509382a74b75b77559f42991f65b86139ea971c7be"

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
