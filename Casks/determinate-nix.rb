cask "determinate-nix" do
  version "3.21.9"
  sha256 "f6a266434f08606a023fd5bd33a77b868016256265ba5668ad0748d71d1625b0"

  url "https://github.com/DeterminateSystems/nix-installer/releases/download/v#{version}/nix-installer-aarch64-darwin",
      verified: "github.com/DeterminateSystems/nix-installer/"
  name "Determinate Nix"
  desc "Nix package manager, installed via the Determinate Systems nix-installer"
  homepage "https://github.com/DeterminateSystems/nix-installer"

  livecheck do
    url "https://github.com/DeterminateSystems/nix-installer/releases/latest"
    strategy :github_latest
  end

  # Only an aarch64-darwin build is published for macOS.
  depends_on arch: :arm64

  installer script: {
    executable: "nix-installer-aarch64-darwin",
    args:       ["install", "--no-confirm"],
    sudo:       true,
  }

  # The download is a bare Mach-O executable: make it runnable and strip the
  # download quarantine so Gatekeeper does not block it, then run it.
  preflight do
    binary = "#{staged_path}/nix-installer-aarch64-darwin"
    system_command "/bin/chmod", args: ["+x", binary]
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", binary], must_succeed: false
  end

  uninstall script: {
    executable: "/nix/nix-installer",
    args:       ["uninstall", "--no-confirm"],
    sudo:       true,
  }

  caveats <<~EOS
    Nix was installed system-wide (creates the /nix volume + nix-daemon).
    Open a new terminal for `nix` to be on your PATH.

    To remove it later:
      brew uninstall --cask determinate-nix
  EOS
end
