cask 'neovide' do
  version '0.6.0'
  sha256 '79c92f40e9b557dec6e2aafd0f248ba8af320e912fe44e0c4e5a93ddc1721458'

  url "https://github.com/neovide/neovide/releases/download/#{version}/Neovide.app.zip"
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
