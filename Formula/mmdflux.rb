class Mmdflux < Formula
  desc "Render Mermaid diagrams as Unicode text, ASCII, SVG, and MMDS JSON"
  homepage "https://github.com/kevinswiber/mmdflux"
  version "2.4.2"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/kevinswiber/mmdflux/releases/download/mmdflux-v2.4.2/mmdflux-v2.4.2-darwin-arm64.tar.gz"
      sha256 "69f77759a8ba9dba19c64bfc0109d8e92300cf26eefc9182179ac0e4f559cb5e"
    else
      url "https://github.com/kevinswiber/mmdflux/releases/download/mmdflux-v2.4.2/mmdflux-v2.4.2-darwin-x86_64.tar.gz"
      sha256 "b8fe0ff2273e575c10b318baed508db434da99da47e36d8637783798b8fe3175"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/kevinswiber/mmdflux/releases/download/mmdflux-v2.4.2/mmdflux-v2.4.2-linux-x86_64.tar.gz"
      sha256 "c41ac8baef4c001f715da4b64a7a40c83557c6f1fc8a6a36f54a9e269582019b"
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
