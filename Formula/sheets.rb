class Sheets < Formula
  desc "Terminal spreadsheet editor with vim-like keybindings"
  homepage "https://github.com/maaslalani/sheets"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/maaslalani/sheets/releases/download/v0.3.0/sheets_Darwin_arm64.tar.gz"
      sha256 "7de3ca5f0742c0ee98e09e8773b4d407d7ba6272135cba2d829ed57b9c0451ec"
    end

    on_intel do
      url "https://github.com/maaslalani/sheets/releases/download/v0.1.0/sheets_Darwin_x86_64.tar.gz"
      sha256 "54ae46288e4dbd51ee6c2976b7ee8a20e7545f08ab206dc8f14a19382bdb3ebe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/maaslalani/sheets/releases/download/v0.1.0/sheets_Linux_arm64.tar.gz"
      sha256 "516ef9f6c562383d4f54cf4253206dfc8e6703c6652cf7c9c16637e8821e9da7"
    end

    on_intel do
      url "https://github.com/maaslalani/sheets/releases/download/v0.1.0/sheets_Linux_x86_64.tar.gz"
      sha256 "f6a87faacea136a5c7ea53d760b5d8262cb533c9b91c060124404bee964b2aef"
    end
  end

  def install
    bin.install "sheets"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sheets --version")
  end
end
