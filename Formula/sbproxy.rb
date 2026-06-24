class Sbproxy < Formula
  desc "Reverse proxy that doubles as an AI gateway for APIs, MCP, and crawlers"
  homepage "https://sbproxy.dev"
  license "Apache-2.0"
  version "1.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_darwin_arm64.tar.gz"
      sha256 "0a10a5798cca94f1311be7f531cb00ac2c4450f37d237ba98fc0a99f08ff2759"
    else
      odie <<~EOS
        sbproxy v#{version} does not ship a darwin/amd64 (Intel Mac) bottle.
        The GitHub macos-13 runner pool has multi-hour queue times that
        stall every release. Use one of these instead:

          1. Run the linux/amd64 image under Docker:
               docker run --rm ghcr.io/soapbucket/sbproxy:#{version} --version
          2. Build from source:
               git clone https://github.com/soapbucket/sbproxy
               cd sbproxy && cargo build --release --bin sbproxy
      EOS
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_linux_arm64.tar.gz"
      sha256 "9e0efe41aabf69cacfea2daddc23f8c36de96e60ee2987fbfa19eab063f7dc6a"
    else
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_linux_amd64.tar.gz"
      sha256 "ec02fced5b458f8fcd86a202a2b7f45ab01e2cdef49d6cd5fb71357159303a1b"
    end
  end

  def install
    bin.install "sbproxy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sbproxy --version")
  end
end
