class CodebaseMemoryMcp < Formula
  desc "Code intelligence MCP server that indexes codebases into a knowledge graph"
  homepage "https://deusdata.github.io/codebase-memory-mcp/"
  version "0.12.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/DeusData/codebase-memory-mcp/releases/download/v#{version}/codebase-memory-mcp-darwin-arm64.tar.gz"
      sha256 "9bfcbe38414b47969a3e1d1c1999f5357409387c86fa3d24221b5458267660d2"
    end

    on_intel do
      url "https://github.com/DeusData/codebase-memory-mcp/releases/download/v#{version}/codebase-memory-mcp-darwin-amd64.tar.gz"
      sha256 "ca6e64397a8ae80cec898a8205a6aa16750ac798acc05a0c3ed983837944a581"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/DeusData/codebase-memory-mcp/releases/download/v#{version}/codebase-memory-mcp-linux-arm64.tar.gz"
      sha256 "8575f126092660b93b170bdc2e06f3ef2dd28d3cc49ad6d0895dc3e4767219cd"
    end

    on_intel do
      url "https://github.com/DeusData/codebase-memory-mcp/releases/download/v#{version}/codebase-memory-mcp-linux-amd64.tar.gz"
      sha256 "8453015145f072c1b9b019cbdd02cea8cc6f18cc5e116036dd20992631c638c7"
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
