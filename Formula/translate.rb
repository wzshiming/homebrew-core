class Translate < Formula
  desc "Use the Google translate interface"
  homepage "https://github.com/wzshiming/translate"
  url "https://github.com/wzshiming/translate/archive/v1.0.0.tar.gz"
  sha256 "dc7871348876fd347b49c7f3309d6e2fe284ad5da4473c352a0d30119873d165"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GOBIN"] = bin
    pkg = "github.com/wzshiming/translate"
    dir = buildpath/"src/#{pkg}/"
    dir.install Dir["*"]
    cd dir do
      system "go", "install", "./cmd/..."
      prefix.install_metafiles
    end
  end

  test do
    system bin/"translate", "-h"
  end
end
