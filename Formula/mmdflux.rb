class Mmdflux < Formula
  desc "Render Mermaid diagrams as Unicode text, ASCII, SVG, and MMDS JSON"
  homepage "https://github.com/kevinswiber/mmdflux"
  version "2.2.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/kevinswiber/mmdflux/releases/download/mmdflux-v2.2.0/mmdflux-v2.2.0-darwin-arm64.tar.gz"
      sha256 "5c75ceb89171c15c63ff59148b7ea0d71e58c57dad7f2730ec879f499dfc33d0"
    else
      url "https://github.com/kevinswiber/mmdflux/releases/download/mmdflux-v2.2.0/mmdflux-v2.2.0-darwin-x86_64.tar.gz"
      sha256 "946a73119a2a38a65e0d2b6da6f68243b5eb7cfbb4681a6c3dbedf088c042036"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/kevinswiber/mmdflux/releases/download/mmdflux-v2.2.0/mmdflux-v2.2.0-linux-x86_64.tar.gz"
      sha256 "3d3b8d646cc98f258362bda2aeed359ca72c5d5644dd7a5e16345e9afd56564f"
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
