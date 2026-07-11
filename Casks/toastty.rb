cask "toastty" do
  version "0.7.3"
  sha256 "f6f18784d24d5f48c1c5641a027f67300b9df03ff993557da71e0aaa186c6410"

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
