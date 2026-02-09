class Mmdflux < Formula
  desc "Render Mermaid diagrams as Unicode text, ASCII, SVG, and MMDS JSON"
  homepage "https://github.com/kevinswiber/mmdflux"
  version "1.0.1"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/kevinswiber/mmdflux/releases/download/v1.0.1/mmdflux-v1.0.1-darwin-arm64.tar.gz"
      sha256 "d51b558358a531654df4769bde364a6a4ab17d622753fa393fe37de2d6c87b83"
    else
      url "https://github.com/kevinswiber/mmdflux/releases/download/v1.0.1/mmdflux-v1.0.1-darwin-x86_64.tar.gz"
      sha256 "f092bf6517ddb0575c5d990600c7f3fb7bd95dd84e0a5a1d576e1f4cd668117d"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/kevinswiber/mmdflux/releases/download/v1.0.1/mmdflux-v1.0.1-linux-x86_64.tar.gz"
      sha256 "38703ee91e094cad4e3467e27eda7c4d8589cc2930679ea791302fd6712dcf77"
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
