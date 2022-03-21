class Difftastic < Formula
  desc "Diff tool that understands syntax"
  homepage "https://difftastic.wilfred.me.uk"
  url "https://github.com/Wilfred/difftastic/archive/refs/tags/0.23.1.tar.gz"
  sha256 "db8b0d3c37800362aef5cb7e2c09ac00a395012251c4d3354b094e06db8ce2d3"
  license "MIT"
  head "https://github.com/Wilfred/difftastic.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match system("difft", "--version"), "Difftastic"
  end
end
