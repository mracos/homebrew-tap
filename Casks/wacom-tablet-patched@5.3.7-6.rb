# Cask recipe reference: https://github.com/fturcheti/homebrew-drivers/blob/c3f8c1c0b89a6869d8729b343e2ed2e90ed8e2c9/Casks/wacom-bamboo-tablet.rb
# Patch to work with catalina https://github.com/thenickdude/wacom-driver-fix/
# Patch reference: https://www.reddit.com/r/wacom/comments/eeznhd/fixed_driver_for_bamboo_tablets_on_macos_catalina/
cask "wacom-tablet-patched@5.3.7-6" do
  version "5.3.7-6,patch-5"
  sha256 "97ed7a0e3f1d3b73c405d3b72adf4eef48374fe216e1fdcbc0a9eb84f823036b"

  url "https://github.com/thenickdude/wacom-driver-fix/releases/download/#{version.csv.second}/Install-Wacom-Tablet-#{version.major_minor_patch}-patched.pkg",
      verified: "github.com/thenickdude/wacom-driver-fix/"
  name "Wacom Bamboo Tablet"
  homepage "https://www.wacom.com/support/product-support/drivers"

  # Pinned to driver version 5.3.7-6; patches tracked manually
  livecheck do
    skip "Versioned cask pinned to driver 5.3.7-6"
  end

  pkg "Install-Wacom-Tablet-#{version.major_minor_patch}-patched.pkg"

  uninstall launchctl: "com.wacom.pentablet",
            quit:      [
              "com.wacom.ConsumerTouchDriver",
              "com.wacom.PenTabletDriver",
              "com.wacom.TabletDriver",
            ],
            pkgutil:   "com.wacom.installpentablet"
end
