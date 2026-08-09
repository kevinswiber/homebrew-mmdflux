class Mmdflux < Formula
  desc "Render Mermaid diagrams as Unicode text, ASCII, SVG, and MMDS JSON"
  homepage "https://github.com/kevinswiber/mmdflux"
  version "2.6.1"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/kevinswiber/mmdflux/releases/download/mmdflux-v2.6.1/mmdflux-v2.6.1-darwin-arm64.tar.gz"
      sha256 "4f09097e024d6d17f110c85bd6e97929080c43eb8808fa22ff51b8721122a780"
    else
      url "https://github.com/kevinswiber/mmdflux/releases/download/mmdflux-v2.6.1/mmdflux-v2.6.1-darwin-x86_64.tar.gz"
      sha256 "9d7ed85ca6a3aef7bf56c7cb43f7dd2211b1658ed8328fadf294580009944c8b"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/kevinswiber/mmdflux/releases/download/mmdflux-v2.6.1/mmdflux-v2.6.1-linux-x86_64.tar.gz"
      sha256 "e83ff7efb3c739b20fa66f1a829cf00d95a58faf744c5584ff921d929226ba91"
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
