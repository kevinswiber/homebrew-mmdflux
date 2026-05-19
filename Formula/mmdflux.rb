class Mmdflux < Formula
  desc "Render Mermaid diagrams as Unicode text, ASCII, SVG, and MMDS JSON"
  homepage "https://github.com/kevinswiber/mmdflux"
  version "2.5.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/kevinswiber/mmdflux/releases/download/mmdflux-v2.5.0/mmdflux-v2.5.0-darwin-arm64.tar.gz"
      sha256 "2bf8c06819368fa6e57a1800ff3f314f9e11b8c34ff57606bf43afdb3b091501"
    else
      url "https://github.com/kevinswiber/mmdflux/releases/download/mmdflux-v2.5.0/mmdflux-v2.5.0-darwin-x86_64.tar.gz"
      sha256 "ad4d6c2b4c4fe5c170876c3a6b7b79b5ed4a21629ecbfac03c20e804201d83f1"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/kevinswiber/mmdflux/releases/download/mmdflux-v2.5.0/mmdflux-v2.5.0-linux-x86_64.tar.gz"
      sha256 "3367d9607d57bdd808264993d4eecfdf0256f3c1e50d38368c9d0fe730729efa"
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
