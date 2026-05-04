class Mmdflux < Formula
  desc "Render Mermaid diagrams as Unicode text, ASCII, SVG, and MMDS JSON"
  homepage "https://github.com/kevinswiber/mmdflux"
  version "2.3.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/kevinswiber/mmdflux/releases/download/mmdflux-v2.3.0/mmdflux-v2.3.0-darwin-arm64.tar.gz"
      sha256 "e5a080594957c62047e2946bb1bd6f9131d4cac4ced1edf622844bafc1658dc6"
    else
      url "https://github.com/kevinswiber/mmdflux/releases/download/mmdflux-v2.3.0/mmdflux-v2.3.0-darwin-x86_64.tar.gz"
      sha256 "76f205d6fb7ad546cf5c1daa0e9d24e574d2fed77912f9c0b3ab6f5c9d9849ba"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/kevinswiber/mmdflux/releases/download/mmdflux-v2.3.0/mmdflux-v2.3.0-linux-x86_64.tar.gz"
      sha256 "bab560279ef62c5afd650ee0f5fb5f845016816256378556603a32002ba3011c"
    else
      odie "Linux ARM64 binaries are not published yet."
    end
  end

  def install
    bin.install "mmdflux"
  end

  test do
    assert_match "Usage: mmdflux", shell_output("#{bin}/mmdflux --help")
  end
end
