class DisplaySwitch < Formula
  desc "Turn a $30 USB switch into a full-featured multi-monitor KVM switch"
  homepage "https://github.com/haimgel/display-switch/"
  url "https://github.com/haimgel/display-switch/archive/refs/tags/0.3.0.tar.gz"
  sha256 "2379768495b7788be549beb0fb43b837571cedd6385aae941029cfc4e8d5baca"
  license "MIT"

  depends_on "libusb" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  service do
    run [opt_bin/"display_switch"]
  end

  test do
    error_exit_status = 101
    # We expect an 101 because display_switch fails
    shell_output(bin/"display_switch", error_exit_status)
  end
end
