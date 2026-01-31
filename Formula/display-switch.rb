class DisplaySwitch < Formula
  desc "Turn a $30 USB switch into a full-featured multi-monitor KVM switch"
  homepage "https://github.com/haimgel/display-switch/"
  url "https://github.com/haimgel/display-switch/archive/refs/tags/1.4.1.tar.gz"
  sha256 "cb1de2b1e943ab52e16959444f7a125646ffe5b2c5df4576b5aae57749efea6a"
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
