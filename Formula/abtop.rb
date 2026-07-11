class Abtop < Formula
  desc "AI agent monitor for your terminal"
  homepage "https://github.com/graykode/abtop"
  version "0.5.3"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/graykode/abtop/releases/download/v0.5.3/abtop-aarch64-apple-darwin.tar.xz"
      sha256 "c35e3c3a66d8c8f90835e479445ca643872ebdcc5c1577944285a16661b17683"
    end
    if Hardware::CPU.intel?
      url "https://github.com/graykode/abtop/releases/download/v0.5.3/abtop-x86_64-apple-darwin.tar.xz"
      sha256 "40a3865ac45df9c81ac9240353b705ec5632ce0684f8de83af8d0a1e8c2d8c87"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/graykode/abtop/releases/download/v0.5.3/abtop-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "8e2e783e1f6c1f7d4cc7d04299697f5ec34ede0405e43247ec0d1aa8e528f443"
    end
    if Hardware::CPU.intel?
      url "https://github.com/graykode/abtop/releases/download/v0.5.3/abtop-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "840d2a5148a70aa907c1326ea72642891304e9e81cf997e684a1151055b5ad3a"
    end
  end

  def install
    bin.install "abtop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/abtop --version")
  end
end
