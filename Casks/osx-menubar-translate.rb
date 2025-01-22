cask "osx-menubar-translate" do
  version "1.2.1"
  sha256 "45f7dacfa94a55d57140e3f982366c4aa2beb32730f293cfe27377d8f2efe813"

  url "https://github.com/zetxek/osx-menubar-translate/releases/download/v#{version}/TranslateMenu-#{version}.zip"
  name "Translate Menu.app"
  homepage "https://github.com/zetxek/osx-menubar-translate"

  livecheck do
    url "https://github.com/zetxek/osx-menubar-translate"
    strategy :github_releases
  end

  app "Translate Menu.app"
end
