class Gws < Formula
  desc "Google Workspace CLI for Drive, Gmail, Calendar, Sheets, Docs, Chat, Admin"
  homepage "https://github.com/googleworkspace/cli"
  version "0.22.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/googleworkspace/cli/releases/download/v0.22.5/google-workspace-cli-aarch64-apple-darwin.tar.gz"
      sha256 "1d2a9ffd5bc9b2c2c4b48630daf082fad13d9e57d741988a2c248eed562f7dac"
    end

    on_intel do
      url "https://github.com/googleworkspace/cli/releases/download/v0.22.5/google-workspace-cli-x86_64-apple-darwin.tar.gz"
      sha256 "51f9bd731404d4bba26c36e2e30dd68c56dccd1f834c01252cb0b14d6a6544b2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/googleworkspace/cli/releases/download/v0.22.5/google-workspace-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "94490295d9580e1e88574e715a0a162991747d12d62f8c7b8dcc8268b6c1cea0"
    end

    on_intel do
      url "https://github.com/googleworkspace/cli/releases/download/v0.22.5/google-workspace-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "de78ecdbd2f1a84cca0063a7ecbc440240fc14b6ebccbb17f4646b792a8c5c1f"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match "gws #{version}", shell_output("#{bin}/gws --version")
  end
end
