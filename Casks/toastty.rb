cask "toastty" do
  version "0.6.5"
  sha256 "53430ae2dfa416ebd8f6886169fbd6b2c50e3a95efec09e8960e464e1608ba30"

  url "https://github.com/figelwump/toastty/releases/download/v#{version}/Toastty-#{version}.dmg"
  name "Toastty"
  desc "Native terminal multiplexer built on libghostty"
  homepage "https://github.com/figelwump/toastty"

  livecheck do
    url "https://github.com/figelwump/toastty/releases/latest"
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "Toastty.app"
end
