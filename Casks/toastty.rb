cask "toastty" do
  version "0.2.1"
  sha256 "e106177a4396712428b89739f21b6b6b30f49693a7ca823bacc91dfac0964117"

  url "https://github.com/figelwump/toastty/releases/download/v#{version}/Toastty-#{version}.dmg"
  name "Toastty"
  desc "Native terminal multiplexer built on libghostty"
  homepage "https://github.com/figelwump/toastty"

  livecheck do
    url "https://github.com/figelwump/toastty/releases/latest"
    strategy :github_latest
  end

  app "Toastty.app"
end
