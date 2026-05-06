class Mmdflux < Formula
  desc "Render Mermaid diagrams as Unicode text, ASCII, SVG, and MMDS JSON"
  homepage "https://github.com/kevinswiber/mmdflux"
  version "2.4.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/kevinswiber/mmdflux/releases/download/mmdflux-v2.4.0/mmdflux-v2.4.0-darwin-arm64.tar.gz"
      sha256 "be36db8e8dcd5061d2f2a69229c71c6b82ab40bc17423015730f218d0a9bb107"
    else
      url "https://github.com/kevinswiber/mmdflux/releases/download/mmdflux-v2.4.0/mmdflux-v2.4.0-darwin-x86_64.tar.gz"
      sha256 "02391bac23506a3de1c707dc9287bd5f778f62966e0e909fac6411884c487369"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/kevinswiber/mmdflux/releases/download/mmdflux-v2.4.0/mmdflux-v2.4.0-linux-x86_64.tar.gz"
      sha256 "5cf222b92adffc3e9cf32ad8a51a67cb6da7b4ad6cfde91493a11aa0d828ac69"
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
