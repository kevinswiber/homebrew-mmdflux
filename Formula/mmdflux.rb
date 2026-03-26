class Mmdflux < Formula
  desc "Render Mermaid diagrams as Unicode text, ASCII, SVG, and MMDS JSON"
  homepage "https://github.com/kevinswiber/mmdflux"
  version "2.0.2"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/kevinswiber/mmdflux/releases/download/mmdflux-v2.0.2/mmdflux-v2.0.2-darwin-arm64.tar.gz"
      sha256 "77026b80817e49954ea0fa1728f5ea57d3659c7d04c6ba2fbffe26abd96dd2b9"
    else
      url "https://github.com/kevinswiber/mmdflux/releases/download/mmdflux-v2.0.2/mmdflux-v2.0.2-darwin-x86_64.tar.gz"
      sha256 "f1bef876dfc4ad65c09af07bfe2797e0b7a93f363566e3f7b05a858ce7814b9d"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/kevinswiber/mmdflux/releases/download/mmdflux-v2.0.2/mmdflux-v2.0.2-linux-x86_64.tar.gz"
      sha256 "aacb976e08f31a5e94bacd364ea60a474364d9e991603b7459ec94de04dd8ef0"
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
