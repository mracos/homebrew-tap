cask "toastty" do
  version "0.8.0"
  sha256 "7be0f902822c710827a7c376429457bdb95c6b2a9ad410d83d36bf8a1c3ecbb4"

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
