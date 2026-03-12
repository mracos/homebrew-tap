class Gws < Formula
  desc "Google Workspace CLI for Drive, Gmail, Calendar, Sheets, Docs, Chat, Admin"
  homepage "https://github.com/googleworkspace/cli"
  version "0.11.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/googleworkspace/cli/releases/download/v#{version}/gws-aarch64-apple-darwin.tar.gz"
      sha256 "45be34945091dde65384497919ec19d6babbadc669ac1067252a11704feb5073"
    end

    on_intel do
      url "https://github.com/googleworkspace/cli/releases/download/v#{version}/gws-x86_64-apple-darwin.tar.gz"
      sha256 "24a3d14a745e78f4a4ae6bf9a2b1862cfc4786629c3efb6324a5ffce4fbfb644"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/googleworkspace/cli/releases/download/v#{version}/gws-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "27d2e70b967d656b319d088aae7e40a1fbd6f87ccf497c8fc62cb52b3689d3ab"
    end

    on_intel do
      url "https://github.com/googleworkspace/cli/releases/download/v#{version}/gws-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "769118e1aa1041bbdaa2e9ee5fe1ca0165d6675d2b931aaae40681a752d86064"
    end
  end

  def install
    bin.install "gws"
  end

  test do
    assert_match "gws #{version}", shell_output("#{bin}/gws --version")
  end
end
