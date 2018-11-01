class Resp < Formula
  desc "Redis server using a protocol called RESP (REdis Serialization Protocol) for golang"
  homepage "https://github.com/wzshiming/resp"
  url "https://github.com/wzshiming/resp/archive/v1.0.0.tar.gz"
  sha256 "50c1bf3ee6f2de457f7881cb8f6019804de560dd89ad0c2afd4d2ff564269015"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GOBIN"] = bin
    pkg = "github.com/wzshiming/resp"
    dir = buildpath/"src/#{pkg}/"
    dir.install Dir["*"]
    cd dir do
      system "go", "install", "./cmd/..."
      prefix.install_metafiles
    end
  end

  test do
    system bin/"resp", "-h"
  end
end
