class Mmdflux < Formula
  desc "Render Mermaid diagrams as Unicode text, ASCII, SVG, and MMDS JSON"
  homepage "https://github.com/kevinswiber/mmdflux"
  version "1.3.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/kevinswiber/mmdflux/releases/download/v1.3.0/mmdflux-v1.3.0-darwin-arm64.tar.gz"
      sha256 "8a85338223d602bff272e16ad9d95de0ba4d2c88ce4635b7097836ef8445c965"
    else
      url "https://github.com/kevinswiber/mmdflux/releases/download/v1.3.0/mmdflux-v1.3.0-darwin-x86_64.tar.gz"
      sha256 "b5ca9a162a8e946878122629752a2700b9e53d431a630ef39029a007fc9f97da"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/kevinswiber/mmdflux/releases/download/v1.3.0/mmdflux-v1.3.0-linux-x86_64.tar.gz"
      sha256 "a938848f843febfd568e13927bfbe1c7bbab3ceff19e1254242727d9b1bc42fa"
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
