cask "osx-menubar-translate" do
  version "1.2.4"
  sha256 "c86f0f7eb9fb793ce21c21ed1fbbcba889b72951199f3002922e67b996cafae1"

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
