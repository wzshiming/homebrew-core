class Pbar < Formula
  desc "Custom console terminal progress bar"
  homepage "https://github.com/wzshiming/pbar/"
  url "https://github.com/wzshiming/pbar/archive/v2.0.1.tar.gz"
  sha256 "a5d50280d5a9c4a4a7d24eb73c0a07a1bf64533057e916137879fe677882c70c"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GOBIN"] = bin
    pkg = "github.com/wzshiming/pbar"
    dir = buildpath/"src/#{pkg}/"
    dir.install Dir["*"]
    cd dir do
      system "go", "install", "./cmd/..."
      prefix.install_metafiles
    end
  end

  test do
    system bin/"pbar", "-h"
  end
end
