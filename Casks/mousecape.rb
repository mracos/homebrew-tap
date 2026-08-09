cask "mousecape" do
  version "1813"
  sha256 "969ec7146af527e8900945950e9945f2b15c4eb19ff835f86da6332ec522ffd2"

  url "https://github.com/alexzielenski/Mousecape/releases/download/#{version}/Mousecape_#{version}.zip"
  name "Mousecape.app"
  homepage "https://github.com/alexzielenski/Mousecape"

  livecheck do
    url :url
    strategy :github_latest
    regex(/^v?(\d+(?:\.\d+)*)$/i)
  end

  depends_on :macos

  app "Mousecape.app"

  caveats do
    requires_rosetta
  end
end
