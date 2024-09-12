cask "osx-menubar-translate" do
  version "1.1.1"
  sha256 "90340c0fa88156a6bae82fcac73a0a01773bda0cb430de4473bb2ac1f26cf89d"

  url "https://github.com/zetxek/osx-menubar-translate/releases/download/v#{version}/MenubarTranslate-#{version}.app.zip"
  name "Translate Menu.app"
  homepage "https://github.com/zetxek/osx-menubar-translate"

  livecheck do
    url "https://github.com/zetxek/osx-menubar-translate"
    strategy :github_releases
  end

  app "Translate Menu.app"
end
