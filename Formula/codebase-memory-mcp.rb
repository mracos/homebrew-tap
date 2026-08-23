class CodebaseMemoryMcp < Formula
  desc "Code intelligence MCP server that indexes codebases into a knowledge graph"
  homepage "https://deusdata.github.io/codebase-memory-mcp/"
  version "0.10.8"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/DeusData/codebase-memory-mcp/releases/download/v#{version}/codebase-memory-mcp-darwin-arm64.tar.gz"
      sha256 "9bd840dfb3ec7eaef4f310382057adaa5b0e904df883104d03ffcf39836afd07"
    end

    on_intel do
      url "https://github.com/DeusData/codebase-memory-mcp/releases/download/v#{version}/codebase-memory-mcp-darwin-amd64.tar.gz"
      sha256 "2b193085410af3801634a522f4b17dcd6699695e015a068393c87817c1d260d4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/DeusData/codebase-memory-mcp/releases/download/v#{version}/codebase-memory-mcp-linux-arm64.tar.gz"
      sha256 "e2804a20f5a6fc392af361525a232703e351b7d1aacb81b88eef806eec5959fa"
    end

    on_intel do
      url "https://github.com/DeusData/codebase-memory-mcp/releases/download/v#{version}/codebase-memory-mcp-linux-amd64.tar.gz"
      sha256 "e5cba4cad6ca8254a85f45041fc8a831908d7d5cb64f98fc3f8eb70a58671793"
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
