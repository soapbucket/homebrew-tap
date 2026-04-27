class Sbproxy < Formula
  desc "High-performance reverse proxy and AI gateway"
  homepage "https://sbproxy.dev"
  license "Apache-2.0"
  version "1.0.0-go-final"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_darwin_arm64.tar.gz"
      sha256 "28d8d697c35fb820f041715e9d59165f7a16c60bd1174d341d39d9a163f6ac28"
    else
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_darwin_amd64.tar.gz"
      sha256 "a5d2c67e69291ea082073ca8fc4def00f639405d7c05c7fb74039f9628f8ee5a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_linux_arm64.tar.gz"
      sha256 "db0d37928263c1cc38669c9847f9aa8366ca4a70729e6fee18ce5b433078302d"
    else
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_linux_amd64.tar.gz"
      sha256 "a8d0631802f74f4caafa003e5574fa0a9ce9ddabb45f4897e7dce571857d5834"
    end
  end

  def install
    bin.install "sbproxy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sbproxy --version")
  end
end
