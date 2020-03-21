# Cask recipe reference: https://github.com/fturcheti/homebrew-drivers/blob/c3f8c1c0b89a6869d8729b343e2ed2e90ed8e2c9/Casks/wacom-bamboo-tablet.rb
# Patch to work with catalina https://github.com/thenickdude/wacom-driver-fix/
# Patch reference: https://www.reddit.com/r/wacom/comments/eeznhd/fixed_driver_for_bamboo_tablets_on_macos_catalina/
cask 'wacom-tablet-patched@5.3.7-6' do
  version '5.3.7-6,patch-4'

  sha256 '97ed7a0e3f1d3b73c405d3b72adf4eef48374fe216e1fdcbc0a9eb84f823036b'
  
  url "https://github.com/thenickdude/wacom-driver-fix/releases/download/#{version.after_comma}/Install-Wacom-Tablet-#{version.major_minor_patch}-patched.pkg"
  name 'Wacom Bamboo Tablet'
  homepage 'https://www.wacom.com/support/product-support/drivers'

  pkg "Install-Wacom-Tablet-#{version}-patched.pkg"

  uninstall launchctl: 'com.wacom.pentablet',
            quit:      [
                         'com.wacom.TabletDriver',
                         'com.wacom.PenTabletDriver',
                         'com.wacom.ConsumerTouchDriver',
                       ],
            pkgutil:   'com.wacom.installpentablet'
end