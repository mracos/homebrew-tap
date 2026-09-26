cask "toastty" do
  version "0.8.2"
  sha256 "bc56f4242a49f4445116b14a9aa27267e9fddad6c926cfa29752e33f2f508edd"

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
