class Befunge < Formula
  desc "Befunge-93 interpreter written in Golang with a debugger"
  homepage "https://github.com/wzshiming/befunge"
  url "https://github.com/wzshiming/befunge/archive/v0.1.1.tar.gz"
  sha256 "fa84ef1ced77a18ecf9056a1547729f3159006e9214bee940e4687b62957c643"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GOBIN"] = bin
    pkg = "github.com/wzshiming/befunge"
    dir = buildpath/"src/#{pkg}/"
    dir.install Dir["*"]
    cd dir do
      system "go", "install", "./cmd/..."
      prefix.install_metafiles
    end
  end

  test do
    system bin/"befunge", "-h"
  end
end
