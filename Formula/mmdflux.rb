class Mmdflux < Formula
  desc "Render Mermaid diagrams as Unicode text, ASCII, SVG, and MMDS JSON"
  homepage "https://github.com/kevinswiber/mmdflux"
  version "2.0.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/kevinswiber/mmdflux/releases/download/v2.0.0/mmdflux-v2.0.0-darwin-arm64.tar.gz"
      sha256 "23a6ef87a23e6cbd45e90424e5f4e11e4ea81393583c78222071c3e354687707"
    else
      url "https://github.com/kevinswiber/mmdflux/releases/download/v2.0.0/mmdflux-v2.0.0-darwin-x86_64.tar.gz"
      sha256 "b0348683c71e7d6441acdfa0ed78ad04366a573a8e660f84c47af2581c566ce9"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/kevinswiber/mmdflux/releases/download/v2.0.0/mmdflux-v2.0.0-linux-x86_64.tar.gz"
      sha256 "ab7f0f78af2b1278fa16a6c15acd3d4f157cb9d706cbadd3bda3b9543b762b33"
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
