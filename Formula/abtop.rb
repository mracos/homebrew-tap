class Abtop < Formula
  desc "AI agent monitor for your terminal"
  homepage "https://github.com/graykode/abtop"
  version "0.5.5"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/graykode/abtop/releases/download/v#{version}/abtop-aarch64-apple-darwin.tar.xz"
      sha256 "9d0b4554d1efcde099d86197edec48d6dc19e2eea3df133a960ad2ecdfe18703"
    end
    if Hardware::CPU.intel?
      url "https://github.com/graykode/abtop/releases/download/v#{version}/abtop-x86_64-apple-darwin.tar.xz"
      sha256 "d44923a88b3ec214b496e72a16fdb426e2f7aadc0324515c4c2fbb8e93c68a7b"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/graykode/abtop/releases/download/v#{version}/abtop-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "4820294003933717ec5e906d9bbc475f2f751c03ed079d25eda1ebcd9e2ab58c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/graykode/abtop/releases/download/v#{version}/abtop-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "ae2f264561c11751748b4a6fb254a1648d5951fb541cf6d8e074f2cf75bdedf8"
    end
  end

  def install
    bin.install "abtop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/abtop --version")
  end
end
