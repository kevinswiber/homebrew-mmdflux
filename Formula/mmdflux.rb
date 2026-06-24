class Mmdflux < Formula
  desc "Render Mermaid diagrams as Unicode text, ASCII, SVG, and MMDS JSON"
  homepage "https://github.com/kevinswiber/mmdflux"
  version "2.6.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/kevinswiber/mmdflux/releases/download/mmdflux-v2.6.0/mmdflux-v2.6.0-darwin-arm64.tar.gz"
      sha256 "157d5dbd07ca1947a90387ed9d1b7768b569ea30053f010dc0e004d63f082320"
    else
      url "https://github.com/kevinswiber/mmdflux/releases/download/mmdflux-v2.6.0/mmdflux-v2.6.0-darwin-x86_64.tar.gz"
      sha256 "51215858128001a4fed3e0376ed546e6cd5a2a48fc8534df1e1a2c8f5168135b"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/kevinswiber/mmdflux/releases/download/mmdflux-v2.6.0/mmdflux-v2.6.0-linux-x86_64.tar.gz"
      sha256 "533267ed07d70160a0f1fcd1bfc816bf1c39503c05688272902396d81527205b"
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
