class Mmdflux < Formula
  desc "Render Mermaid diagrams as Unicode text, ASCII, SVG, and MMDS JSON"
  homepage "https://github.com/kevinswiber/mmdflux"
  version "1.4.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/kevinswiber/mmdflux/releases/download/v1.4.0/mmdflux-v1.4.0-darwin-arm64.tar.gz"
      sha256 "60f21c469fddc6afb262012b8af6abd99029397d5fbb6d44664d68d1d98ed285"
    else
      url "https://github.com/kevinswiber/mmdflux/releases/download/v1.4.0/mmdflux-v1.4.0-darwin-x86_64.tar.gz"
      sha256 "ca61107441c090885bc10d7a7cb530d0d4493b7a072027d2c9bacd2318d87344"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/kevinswiber/mmdflux/releases/download/v1.4.0/mmdflux-v1.4.0-linux-x86_64.tar.gz"
      sha256 "e7bed40d133a4c84fbbe828337fbbcc2c1610a3cd44bea432d495edeaa9efc14"
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
