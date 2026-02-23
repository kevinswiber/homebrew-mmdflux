class Mmdflux < Formula
  desc "Render Mermaid diagrams as Unicode text, ASCII, SVG, and MMDS JSON"
  homepage "https://github.com/kevinswiber/mmdflux"
  version "1.2.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/kevinswiber/mmdflux/releases/download/v1.2.0/mmdflux-v1.2.0-darwin-arm64.tar.gz"
      sha256 "27d9db0ddb238603a7e05dcbc0a171a95094ff3cb8c9209f6a28352e05595d06"
    else
      url "https://github.com/kevinswiber/mmdflux/releases/download/v1.2.0/mmdflux-v1.2.0-darwin-x86_64.tar.gz"
      sha256 "f095d457dc692a5c6c7dc9c76e19cd1811ee3de586bb0ea3b499e5a7a99419ee"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/kevinswiber/mmdflux/releases/download/v1.2.0/mmdflux-v1.2.0-linux-x86_64.tar.gz"
      sha256 "44f7aed0259b0befd8646662c9a210e1631bc56474790c1292b998a847e23595"
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
