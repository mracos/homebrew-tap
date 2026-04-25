cask "toastty" do
  version "0.6.1"
  sha256 "b5fdf576fc56aeeae37753e7370cb6f81ec9005ad3369ac2cb2b5c22e2842aed"

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
