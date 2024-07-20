# from: https://github.com/jason0x43/homebrew-neovim-nightly
# with patchs from
# - https://github.com/ryoppippi/homebrew-neovim-nightly/commit/89a32415e0d50c72f73ffb45cfb4ad15bad45d36
# - https://github.com/Reyu/homebrew-neovim-nightly/commit/57840f8da0fa1e56cdc742e4fc2705ae9a0cd00a
# - https://github.com/Reyu/homebrew-neovim-nightly/commit/2f037a81bd89bf270767329bb51d92e21db1e773
cask "neovim-nightly" do
  arch arm: "aarch64", intel: "x86_64"
  arch_fragment = on_arch_conditional arm: "arm64", intel: "x86_64"

  version :latest
  sha256 :no_check

  url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch_fragment}.tar.gz",
      verified: "github.com/neovim/neovim/"
  name "Neovim Nightly"
  homepage "https://neovim.io/"

  conflicts_with formula: "neovim"

  binary "nvim-macos-#{arch_fragment}/bin/nvim"
end
