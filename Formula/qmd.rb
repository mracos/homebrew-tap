class Qmd < Formula
  desc "Local search engine for markdown notes, docs and meeting transcripts"
  homepage "https://github.com/tobi/qmd"
  url "https://registry.npmjs.org/@tobilu/qmd/-/qmd-2.9.0.tgz"
  sha256 "436ce43f4dd9e64ee734c86964195aa049f0abc34ab9ed6d90608ad4b20665d4"
  license "MIT"

  depends_on "node"

  on_macos do
    depends_on "sqlite"
  end

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")

    os = OS.kernel_name.downcase
    arch = Hardware::CPU.intel? ? "x64" : Hardware::CPU.arch.to_s
    libexec.glob("lib/node_modules/@tobilu/qmd/node_modules/**/prebuilds/*").each do |dir|
      rm_r(dir) if dir.basename(".node").to_s != "#{os}-#{arch}"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/qmd --version")
  end
end
