cask 'tomahawk' do	
  version '0.8.4'	
  sha256 '65fba8767e21b898a61feeb077ae9a87685b5ebf4d2ecbccddd7168e85e695da'	

  url "http://download.tomahawk-player.org/Tomahawk-#{version}.dmg"	

  livecheck do
    url "https://github.com/tomahawk-player/tomahawk"
    strategy :github_releases
  end

  name 'Tomahawk'	
  homepage 'https://www.tomahawk-player.org/'	

  app 'Tomahawk.app'	
end