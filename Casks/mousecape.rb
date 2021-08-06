cask "mousecape" do
  version "1813"
  sha256 "969ec7146af527e8900945950e9945f2b15c4eb19ff835f86da6332ec522ffd2"

  url "https://github.com/alexzielenski/Mousecape/releases/download/#{version}/Mousecape_#{version}.zip"
  appcast "https://github.com/alexzielenski/Mousecape/releases.atom"
  name "Mousecape.app"
  homepage "https://github.com/alexzielenski/Mousecape"

  app "Mousecape.app"
end
