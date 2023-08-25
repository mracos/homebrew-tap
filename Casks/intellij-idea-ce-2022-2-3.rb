cask "intellij-idea-ce-2022-2-3" do
  arch arm: "-aarch64", intel: nil

  version "2022.2.3"
  sha256 intel: "6ec3721d9961918a14630eaf068765eeba97e71baecd95ec67510dc25c8bd1b1",
         arm: "333c70caf452034ae332cdded4d24a71592049b4045725eb57826a0b997d1c7a"

  url "https://download.jetbrains.com/idea/ideaIC-#{version}#{arch}.dmg"
  name "IntelliJ IDEA Community Edition"
  desc "IDE for JVM languages"
  homepage "https://www.jetbrains.com/idea/"

  auto_updates true

  app "IntelliJ IDEA CE.app"

  uninstall_postflight do
    ENV["PATH"].split(File::PATH_SEPARATOR).map { |path| File.join(path, "idea") }.each do |path|
      if File.readable?(path) &&
         File.readlines(path).grep(/# see com.intellij.idea.SocketLock for the server side of this interface/).any?
        File.delete(path)
      end
    end
  end

  zap trash: [
    "~/Library/Preferences/com.jetbrains.intellij.plist",
    "~/Library/Caches/IntelliJIdea#{version.major_minor}",
    "~/Library/Logs/IntelliJIdea#{version.major_minor}",
    "~/Library/Application Support/IntelliJIdea#{version.major_minor}",
    "~/Library/Preferences/IntelliJIdea#{version.major_minor}",
    "~/Library/Saved Application State/com.jetbrains.intellij.savedState",
  ]

  caveats do
    discontinued
  end
end
