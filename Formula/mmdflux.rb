class Mmdflux < Formula
  desc "Render Mermaid diagrams as Unicode text, ASCII, SVG, and MMDS JSON"
  homepage "https://github.com/kevinswiber/mmdflux"
  version "2.1.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/kevinswiber/mmdflux/releases/download/mmdflux-v2.1.0/mmdflux-v2.1.0-darwin-arm64.tar.gz"
      sha256 "36d65ce6c5a5fb5490cfa8143e84ab4c7cd1374939c81a3e126ac289671a1477"
    else
      url "https://github.com/kevinswiber/mmdflux/releases/download/mmdflux-v2.1.0/mmdflux-v2.1.0-darwin-x86_64.tar.gz"
      sha256 "224bb760249880f4f2709faca2ce61ba80bed45cf2af0f741676df17b7b74a06"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/kevinswiber/mmdflux/releases/download/mmdflux-v2.1.0/mmdflux-v2.1.0-linux-x86_64.tar.gz"
      sha256 "564bdc2ec60833f8eddd021275bf9a5fcd61db03c9fb81fa608cd4ac9c5a973a"
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
