class CodebaseMemoryMcp < Formula
  desc "Code intelligence MCP server that indexes codebases into a knowledge graph"
  homepage "https://deusdata.github.io/codebase-memory-mcp/"
  version "0.10.4"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/DeusData/codebase-memory-mcp/releases/download/v#{version}/codebase-memory-mcp-darwin-arm64.tar.gz"
      sha256 "c8814e2e48c72a4dcafc183d436664393d2b22460eb0b826c7982a36800701a2"
    end

    on_intel do
      url "https://github.com/DeusData/codebase-memory-mcp/releases/download/v#{version}/codebase-memory-mcp-darwin-amd64.tar.gz"
      sha256 "378428ac82253a1532ff89a62874342c618c7c758686f153c98eeddb0e6cd612"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/DeusData/codebase-memory-mcp/releases/download/v#{version}/codebase-memory-mcp-linux-arm64.tar.gz"
      sha256 "9dd5ee8dc8ddcc74123953de6098a0c5a89f3cb55cba95710bef9fda1c4b2f6b"
    end

    on_intel do
      url "https://github.com/DeusData/codebase-memory-mcp/releases/download/v#{version}/codebase-memory-mcp-linux-amd64.tar.gz"
      sha256 "8ecb45f1680b28af30518a167dcf557ca0bb8137b2e444ac4353fc7667edd96d"
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
