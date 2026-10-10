cask "toastty" do
  version "0.9.0"
  sha256 "f2e592b619d88dd91e1b089d54d518bf39f4ae587d3dc996a03cef7ee5af81b2"

  url "https://github.com/figelwump/toastty/releases/download/v#{version}/Toastty-#{version}.dmg"
  name "Toastty"
  desc "Native terminal multiplexer built on libghostty"
  homepage "https://github.com/figelwump/toastty"

  livecheck do
    url "https://github.com/figelwump/toastty/releases/latest"
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Toastty.app"
end
