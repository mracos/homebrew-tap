cask "milheiro" do
  version :latest
  sha256 :no_check

  url "https://github.com/mracos/milheiro/releases/latest/download/Milheiro.dmg",
      verified: "github.com/mracos/milheiro/"
  name "Milheiro"
  desc "Safari extension comparing LATAM flight prices in miles vs cash"
  homepage "https://github.com/mracos/milheiro"

  depends_on macos: :big_sur

  app "Milheiro.app"

  caveats <<~EOS
    Safari extension, adhoc-signed. To finish:

      1. Open Milheiro.app once, that is what registers the extension. macOS
         blocks the first launch: allow it in System Settings > Privacy &
         Security > "Open Anyway".
      2. Turn on Safari > Settings > Developer > "Allow unsigned extensions".
         Without it Safari hides the extension, and it resets on every relaunch.
      3. Enable Milheiro in Safari > Settings > Extensions.
  EOS
end
