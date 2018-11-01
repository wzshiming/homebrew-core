class Crun < Formula
  desc "Generate matching strings based on regular expressions"
  homepage "https://github.com/wzshiming/crun"
  url "https://github.com/wzshiming/crun/archive/v0.3.0.tar.gz"
  sha256 "8865e011f0d2242316ab6759b46873f9070448348f12a58e75a6c31c7925bff6"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GOBIN"] = bin
    pkg = "github.com/wzshiming/crun"
    dir = buildpath/"src/#{pkg}/"
    dir.install Dir["*"]
    cd dir do
      system "go", "install", "./cmd/..."
      prefix.install_metafiles
    end
  end

  test do
    system bin/"crun", "-h"
  end
end
