class Abtop < Formula
  desc "AI agent monitor for your terminal"
  homepage "https://github.com/graykode/abtop"
  version "0.5.2"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/graykode/abtop/releases/download/v0.5.2/abtop-aarch64-apple-darwin.tar.xz"
      sha256 "c3af763ba6e9a7f211a2e201723290d29f1ead5b88074d05bf69461b63630db3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/graykode/abtop/releases/download/v0.5.2/abtop-x86_64-apple-darwin.tar.xz"
      sha256 "0d18a4f0faf33c224bc87ce4e140f7823940506842018a3e8b605d370cfc393f"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/graykode/abtop/releases/download/v0.5.2/abtop-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "db3c167a5649c3b82a08195bb61780b9a05b1fff5273cb127a542f162dbc41e0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/graykode/abtop/releases/download/v0.5.2/abtop-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "2af0b65c9d0dbd5f7ed8af84892b4468ee6f3225df3e38d7f8a61fff5abfa478"
    end
  end

  def install
    bin.install "abtop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/abtop --version")
  end
end
