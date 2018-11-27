class Textart < Formula
  desc "text art"
  homepage "https://github.com/wzshiming/textart/"
  url "https://github.com/wzshiming/textart/archive/v1.0.0.tar.gz"
  sha256 "854a92c4d117fd2d6644799ebcf40a37e1ce46d2477c9971f1d61d65cb2d9ff0"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GOBIN"] = bin
    pkg = "github.com/wzshiming/textart"
    dir = buildpath/"src/#{pkg}/"
    dir.install Dir["*"]
    cd dir do
      system "go", "install", "./cmd/..."
      prefix.install_metafiles
    end
  end

  test do
    system bin/"textart", "-h"
  end
end
