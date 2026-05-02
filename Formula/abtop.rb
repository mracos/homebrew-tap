class Abtop < Formula
  desc "AI agent monitor for your terminal"
  homepage "https://github.com/graykode/abtop"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/graykode/abtop/releases/download/v0.4.0/abtop-aarch64-apple-darwin.tar.xz"
      sha256 "7ae9686ad3a527ee42e7ef798be86d6044ab3e95fa493cba261ca03fb8544506"
    end
    if Hardware::CPU.intel?
      url "https://github.com/graykode/abtop/releases/download/v0.2.12/abtop-x86_64-apple-darwin.tar.xz"
      sha256 "52478fa683f6fea9fb995d2d355bd62ffa0e3316ff88a3990bd207c4693d2d2b"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/graykode/abtop/releases/download/v0.2.12/abtop-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "6f778ac62fc71edc3ddafe97479253e1cb1070cba0792a3e8f7fff24f4242fd5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/graykode/abtop/releases/download/v0.2.12/abtop-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "da856d5ed21d02a91de581cb7bd56a7e594ba6d000099779e0e540cfb3f32225"
    end
  end

  def install
    bin.install "abtop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/abtop --version")
  end
end
