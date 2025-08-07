cask "niimprintx" do
  version "0.0.47"

  on_arm do
    sha256 "851211078780f4ef6a76b56027526abfcece133c88ade92f0c66ac2059789a03"
    url "https://github.com/labbots/NiimPrintX/releases/download/v#{version}/NiimPrintX-Installer-v#{version}-MacOSX-arm64.dmg"
  end

  on_intel do
    sha256 "e67405df6a3263dc94c5fdb4139d10617b69c72f4f7485ecc1f0be0bad6694bb"
    url "https://github.com/labbots/NiimPrintX/releases/download/v#{version}/NiimPrintX-App-v#{version}-MacOSX-x86_64.tar.gz"
  end

  name "NiimPrintX"
  desc "Python library to interface with NiimBot label printers via Bluetooth"
  homepage "https://github.com/labbots/NiimPrintX"

  livecheck do
    url "https://github.com/labbots/NiimPrintX/releases/latest"
    strategy :github_latest
  end

  app "NiimPrintX.app"
end