class Ssdb < Formula
  desc "This is the SSDB client and command-line tool."
  homepage "https://github.com/wzshiming/ssdb"
  url "https://github.com/wzshiming/ssdb/archive/v0.1.0.tar.gz"
  sha256 "75b52d6a2855711328c121b89460f20e186f0bb5c752cca8cf05c0a3f91c33b0"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GOBIN"] = bin
    pkg = "github.com/wzshiming/ssdb"
    dir = buildpath/"src/#{pkg}/"
    dir.install Dir["*"]
    cd dir do
      system "go", "install", "./cmd/..."
      prefix.install_metafiles
    end
  end

  test do
    system bin/"ssdb", "-h"
  end
end
