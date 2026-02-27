class Mmdflux < Formula
  desc "Render Mermaid diagrams as Unicode text, ASCII, SVG, and MMDS JSON"
  homepage "https://github.com/kevinswiber/mmdflux"
  version "1.3.1"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/kevinswiber/mmdflux/releases/download/v1.3.1/mmdflux-v1.3.1-darwin-arm64.tar.gz"
      sha256 "a68cbcebc37608546650627d216ddb39354eb7ed2d5a9bea3233eb89f580b069"
    else
      url "https://github.com/kevinswiber/mmdflux/releases/download/v1.3.1/mmdflux-v1.3.1-darwin-x86_64.tar.gz"
      sha256 "24ecbd23c7295685bf72ed887eca6d513b04fe1c94178cf4d3fe2ed3972c99f4"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/kevinswiber/mmdflux/releases/download/v1.3.1/mmdflux-v1.3.1-linux-x86_64.tar.gz"
      sha256 "5931e6d5b1e2d1bc805d2cab86f9c2bf49112808deac904a7da7fe8df0d41f79"
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
