class Sbproxy < Formula
  desc "AI Governance Gateway: one self-hostable runtime for AI traffic, APIs, MCP, and crawlers"
  homepage "https://sbproxy.dev"
  license "BUSL-1.1"
  version "1.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_darwin_arm64.tar.gz"
      sha256 "45ff7b82bf6cd33935e2b1af533192adf6b0ea444ddb8d3f3c05e427f3ce3b01"
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
      sha256 "4a99495c15faeda362f7285677c3ca6111aec77fa071c92afe99f5e782455463"
    else
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_linux_amd64.tar.gz"
      sha256 "bc9c494490e9eea5f91d2418913fb56726812d643b3b6f38db571737335a0fe3"
    end
  end

  def install
    bin.install "sbproxy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sbproxy --version")
  end
end
