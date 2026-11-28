class MermaidAscii < Formula
  desc "Render mermaid diagrams as ASCII art in the terminal"
  homepage "https://github.com/AlexanderGrooff/mermaid-ascii"
  version "1.6.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AlexanderGrooff/mermaid-ascii/releases/download/#{version}/mermaid-ascii_Darwin_arm64.tar.gz"
      sha256 "ee46ce2f41f83ef59830c541c23b99a7937cea278b7502218d079b973fd2ac1b"
    end

    on_intel do
      url "https://github.com/AlexanderGrooff/mermaid-ascii/releases/download/#{version}/mermaid-ascii_Darwin_x86_64.tar.gz"
      sha256 "947c7aae051819b499d20ac109473936cd96fccd51244f1d851bd6161e463f10"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AlexanderGrooff/mermaid-ascii/releases/download/#{version}/mermaid-ascii_Linux_arm64.tar.gz"
      sha256 "121bc3594f08cf41be2d0c9ec31b4103d81b21852290e2817b5c536f66a59446"
    end

    on_intel do
      url "https://github.com/AlexanderGrooff/mermaid-ascii/releases/download/#{version}/mermaid-ascii_Linux_x86_64.tar.gz"
      sha256 "e85222d5cedb39cfc346af02a0b68d2c90663e47d6512cc042fa7eb866bf2a30"
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
