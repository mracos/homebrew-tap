cask "osx-menubar-translate" do
  version "1.2.7"
  sha256 "98061de0a1e2ea9b5a1a5927fd6108092ad41748ce6c3da486bd7bd4f7a933ec"

  url "https://github.com/zetxek/osx-menubar-translate/releases/download/v#{version}/TranslateMenu-#{version}.zip"
  name "Translate Menu.app"
  homepage "https://github.com/zetxek/osx-menubar-translate"

  livecheck do
    url "https://github.com/zetxek/osx-menubar-translate"
    strategy :github_releases
  end

  depends_on :macos

  app "Translate Menu.app"
end
