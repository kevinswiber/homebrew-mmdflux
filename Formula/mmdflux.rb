class Mmdflux < Formula
  desc "Render Mermaid diagrams as Unicode text, ASCII, SVG, and MMDS JSON"
  homepage "https://github.com/kevinswiber/mmdflux"
  version "2.4.1"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/kevinswiber/mmdflux/releases/download/mmdflux-v2.4.1/mmdflux-v2.4.1-darwin-arm64.tar.gz"
      sha256 "8a890e38008376fc2c63a4c0bf385b4fe40ee861dfba478a52a39a6b0bb7acfd"
    else
      url "https://github.com/kevinswiber/mmdflux/releases/download/mmdflux-v2.4.1/mmdflux-v2.4.1-darwin-x86_64.tar.gz"
      sha256 "b2419d60f925143a6cd0dfc3b6364d802c9fecfd6496445ecc2cbd0ed3ec359e"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/kevinswiber/mmdflux/releases/download/mmdflux-v2.4.1/mmdflux-v2.4.1-linux-x86_64.tar.gz"
      sha256 "36596a1e7ca946aff77ec5207e7c0a603e4b6db5e293edb97327ff761af435d4"
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
