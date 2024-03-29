cask 'intellij-idea-ce-2019-1-4' do
  version '2019.1.4'
  sha256 '45e5d4454b7af328c9c1279559a49d8db80eea8eaa1187ff0fc1cc3643074be9'

  url "https://download.jetbrains.com/idea/ideaIC-#{version}.dmg"

  livecheck do
    url "https://data.services.jetbrains.com/products/releases?code=IIC&latest=true&type=release"
    strategy :sparkle, &:version
  end

  name 'IntelliJ IDEA Community Edition'
  homepage 'https://www.jetbrains.com/idea/'

  auto_updates true

  app 'IntelliJ IDEA CE.app'

  uninstall_postflight do
    ENV['PATH'].split(File::PATH_SEPARATOR).map { |path| File.join(path, 'idea') }.each { |path| File.delete(path) if File.exist?(path) && File.readlines(path).grep(%r{# see com.intellij.idea.SocketLock for the server side of this interface}).any? }
  end

  zap trash: [
               "~/Library/Application Support/IdeaIC#{version.major_minor}",
               "~/Library/Caches/IdeaIC#{version.major_minor}",
               "~/Library/Logs/IdeaIC#{version.major_minor}",
               "~/Library/Preferences/IdeaIC#{version.major_minor}",
               '~/Library/Preferences/com.jetbrains.intellij.ce.plist',
               '~/Library/Saved Application State/com.jetbrains.intellij.ce.savedState',
             ]
end
