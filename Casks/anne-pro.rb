cask "anne-pro" do
  version "0.3"
  sha256 "8fb3be3a4d80c631c1f220e024d7629766f93ba2675678f94841bdadd89a1c0e"

  url "https://github.com/msvisser/AnnePro-mac/releases/download/v#{version}/AnnePro.app.zip"
  name "Anne Pro"
  desc "Application for controlling AnnePro keyboard over bluetooth"
  homepage "https://github.com/msvisser/AnnePro-mac"

  livecheck do
    url "https://github.com/msvisser/AnnePro-mac"
    strategy :github_releases
  end

  app "AnnePro.app"
end
