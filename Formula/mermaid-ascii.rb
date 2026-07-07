class MermaidAscii < Formula
  desc "Render mermaid diagrams as ASCII art in the terminal"
  homepage "https://github.com/AlexanderGrooff/mermaid-ascii"
  version "1.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AlexanderGrooff/mermaid-ascii/releases/download/1.3.0/mermaid-ascii_Darwin_arm64.tar.gz"
      sha256 "37e54a460489749451ef3818519eeff1087d3d7452bc50fcc639f8d2665e7b51"
    end

    on_intel do
      url "https://github.com/AlexanderGrooff/mermaid-ascii/releases/download/1.3.0/mermaid-ascii_Darwin_x86_64.tar.gz"
      sha256 "bcfec90bba16aec2da40b7075e5273a469a389bd674568dfb99f36f932c90a6b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AlexanderGrooff/mermaid-ascii/releases/download/1.3.0/mermaid-ascii_Linux_arm64.tar.gz"
      sha256 "a6f4c84f634c6bec511d655faae944be330d2ad60f1001ee2ef3dd5594e26ad3"
    end

    on_intel do
      url "https://github.com/AlexanderGrooff/mermaid-ascii/releases/download/1.3.0/mermaid-ascii_Linux_x86_64.tar.gz"
      sha256 "1db750ef1d4e393d6c914966ac82ae10e6757236586028d10a55b1001f49bf1a"
    end
  end

  def install
    bin.install "mermaid-ascii"
  end

  test do
    (testpath/"flow.mmd").write <<~EOS
      graph LR
      A --> B
    EOS
    output = shell_output("#{bin}/mermaid-ascii --file #{testpath}/flow.mmd")
    assert_match "A", output
    assert_match "B", output
  end
end
