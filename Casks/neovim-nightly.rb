# from: https://github.com/jason0x43/homebrew-neovim-nightly
# with patch from: https://github.com/ryoppippi/homebrew-neovim-nightly/commit/89a32415e0d50c72f73ffb45cfb4ad15bad45d36
cask 'neovim-nightly' do
  version :latest
  sha256 :no_check

  url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz"
  name 'Neovim Nightly'
  homepage 'https://neovim.io/'

  binary 'nvim-macos/bin/nvim'
end
