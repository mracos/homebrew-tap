class Gws < Formula
  desc "Google Workspace CLI for Drive, Gmail, Calendar, Sheets, Docs, Chat, Admin"
  homepage "https://github.com/googleworkspace/cli"
  version "0.22.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/googleworkspace/cli/releases/download/v0.22.3/google-workspace-cli-aarch64-apple-darwin.tar.gz"
      sha256 "3e56ae8005bf33ec14ba3ef1541792b267ef0b6de6c344573eac19457e396d99"
    end

    on_intel do
      url "https://github.com/googleworkspace/cli/releases/download/v0.22.3/google-workspace-cli-x86_64-apple-darwin.tar.gz"
      sha256 "ccb477ceeb75ad301d780692224a61678cbba85251b7dc074fc67e94527f94cd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/googleworkspace/cli/releases/download/v0.22.3/google-workspace-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4cddeb0dff1e0b45023c63915a2d46affe3689b7332a862f913b395e604d4ce1"
    end

    on_intel do
      url "https://github.com/googleworkspace/cli/releases/download/v0.22.3/google-workspace-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b951ef847b38dd41a23d31a3aeaf3cb650421aac607bbfe63727bf4f4213ce44"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match "gws #{version}", shell_output("#{bin}/gws --version")
  end
end
