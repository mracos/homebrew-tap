class Sheets < Formula
  desc "Terminal spreadsheet editor with vim-like keybindings"
  homepage "https://github.com/maaslalani/sheets"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/maaslalani/sheets/releases/download/v#{version}/sheets_Darwin_arm64.tar.gz"
      sha256 "7de3ca5f0742c0ee98e09e8773b4d407d7ba6272135cba2d829ed57b9c0451ec"
    end

    on_intel do
      url "https://github.com/maaslalani/sheets/releases/download/v#{version}/sheets_Darwin_x86_64.tar.gz"
      sha256 "3d80fd6e6ca2316d3ea09617bb378829a631395f45aa9a16b46fad4fe44c1f3a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/maaslalani/sheets/releases/download/v#{version}/sheets_Linux_arm64.tar.gz"
      sha256 "22d615cbab83a81a94d6e70fa212d0218f9a2b2de50185aff8814acd46b376aa"
    end

    on_intel do
      url "https://github.com/maaslalani/sheets/releases/download/v#{version}/sheets_Linux_x86_64.tar.gz"
      sha256 "24369b958de79989832da49cc25bf00fafb0f5bf0119761ea3dbbbfa2a75edaf"
    end
  end

  def install
    bin.install "sheets"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sheets --version")
  end
end
