cask 'intellij-idea-2019-1-4' do
  version '2019.1.4'
  sha256 '600b0446ae02fee208caf4e0423b984a3c853ef289fcd10b6b0e7081e1559d53'

  url "https://download.jetbrains.com/idea/ideaIU-#{version}.dmg"

  livecheck do
    url "https://data.services.jetbrains.com/products/releases?code=IIU&latest=true&type=release"
    strategy :sparkle, &:version
  end

  name 'IntelliJ IDEA Ultimate'
  homepage 'https://www.jetbrains.com/idea/'

  auto_updates true

  app 'IntelliJ IDEA.app'

  uninstall_postflight do
    ENV['PATH'].split(File::PATH_SEPARATOR).map { |path| File.join(path, 'idea') }.each { |path| File.delete(path) if File.exist?(path) && File.readlines(path).grep(%r{# see com.intellij.idea.SocketLock for the server side of this interface}).any? }
  end

  zap trash: [
               '~/Library/Preferences/com.jetbrains.intellij.plist',
               "~/Library/Caches/IntelliJIdea#{version.major_minor}",
               "~/Library/Logs/IntelliJIdea#{version.major_minor}",
               "~/Library/Application Support/IntelliJIdea#{version.major_minor}",
               "~/Library/Preferences/IntelliJIdea#{version.major_minor}",
               '~/Library/Saved Application State/com.jetbrains.intellij.savedState',
             ]
end
