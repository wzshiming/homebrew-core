class Gostruct < Formula
  desc "Golang structure is generated with json data"
  homepage "https://github.com/wzshiming/gostruct"
  url "https://github.com/wzshiming/gostruct/archive/v1.0.0.tar.gz"
  sha256 "9d6588237474dcd605a9e46adbf2e5ff146515dbcf6da7e4d71fb63e803fb71c"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GOBIN"] = bin
    pkg = "github.com/wzshiming/gostruct"
    dir = buildpath/"src/#{pkg}/"
    dir.install Dir["*"]
    cd dir do
      system "go", "install", "./cmd/..."
      prefix.install_metafiles
    end
  end

  test do
    system bin/"gostruct", "-h"
  end
end
