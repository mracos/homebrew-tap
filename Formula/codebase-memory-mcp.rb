class CodebaseMemoryMcp < Formula
  desc "Code intelligence MCP server that indexes codebases into a knowledge graph"
  homepage "https://deusdata.github.io/codebase-memory-mcp/"
  version "0.11.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/DeusData/codebase-memory-mcp/releases/download/v#{version}/codebase-memory-mcp-darwin-arm64.tar.gz"
      sha256 "4dee7f38b63740e6751d7a7ed7eb10291c1f2a3ea2415f599dc68370ca0a2d18"
    end

    on_intel do
      url "https://github.com/DeusData/codebase-memory-mcp/releases/download/v#{version}/codebase-memory-mcp-darwin-amd64.tar.gz"
      sha256 "dbf1c73bfcbde64e7dde4cd1320da7afc02e2c972ee1789ae039521411f5132e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/DeusData/codebase-memory-mcp/releases/download/v#{version}/codebase-memory-mcp-linux-arm64.tar.gz"
      sha256 "c0e46c87cf37e35f1ac0bd9cc7e1d8b0ca4ef40034e1008805d709fa52a4e38a"
    end

    on_intel do
      url "https://github.com/DeusData/codebase-memory-mcp/releases/download/v#{version}/codebase-memory-mcp-linux-amd64.tar.gz"
      sha256 "032b33c1833919a2d1de67ff6367fa6ea46aee8689c86ef223c88fae3b6e4536"
    end
  end

  def install
    bin.install "codebase-memory-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/codebase-memory-mcp --version 2>&1")
  end
end
# brew-capture: Formula/codebase-memory-mcp.rb
