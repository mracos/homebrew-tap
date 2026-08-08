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
    Milheiro is a Safari extension. The build is unsigned, so install with:
      brew install --cask --no-quarantine mracos/tap/milheiro
    Then:
      1. Open Milheiro.app once (registers the extension).
      2. Safari > Settings > Extensions > enable Milheiro.
      3. Safari > Develop > Allow Unsigned Extensions (resets each launch).
  EOS
end
