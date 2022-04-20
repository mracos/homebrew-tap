cask 'neovide' do
  version '0.8.0'
  sha256 '73ee776483161dad707bfaa118b79a9946f10223624e67127e6ecf73fb6eb626'

  url "https://github.com/neovide/neovide/releases/download/#{version}/Neovide.dmg.zip"
  appcast 'https://github.com/neovide/neovide/releases.atom'
  name 'Neovide'
  desc 'No Nonsense Neovim Client in Rust'
  homepage 'https://github.com/neovide/neovide'

  app 'Neovide.app'
  binary "#{appdir}/Neovide.app/Contents/MacOS/neovide"

  postflight do
    # https://github.com/neovide/neovide/issues/466#issuecomment-803289234
    set_permissions "#{appdir}/Neovide.app/Contents/MacOS/neovide", '+x'
  end
end
