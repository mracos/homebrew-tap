cask "calendr" do
  version "1.22.5"
  sha256 "f49ccd003e11197fdf41b2af103c38f32260abac2fd9d4316d93f12a1a2fbf3d"

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
