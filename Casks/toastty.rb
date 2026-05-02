cask "toastty" do
  version "0.6.3"
  sha256 "8cc91b617e6f3d684539e5def394be6626043084165beb3f2451932088962e1a"

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
