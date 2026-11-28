cask "toastty" do
  version "0.10.1"
  sha256 "df8630d22677e6f4979fd57e6c01188d4294613d5598c2de58ffc3f5e94f1853"

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
