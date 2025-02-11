cask "granola" do
  version "5.242.0"
  sha256 "0f27d5e5daafe1af9347d98065ff558973669fe4c14f41fbb68ae9dc8bf8b5a6"

  url "https://dr2v7l5emb758.cloudfront.net/#{version}/Granola-#{version}-mac-universal.dmg"
  name "granola"
  desc "The AI Notepad for meetings"
  homepage "https://www.granola.ai"

  app "Granola.app"
end
