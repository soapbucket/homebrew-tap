class Sbproxy < Formula
  desc "AI gateway and reverse proxy for APIs, MCP, models, and crawlers"
  homepage "https://sbproxy.dev"
  license "Apache-2.0"
  version "1.6.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_darwin_arm64.tar.gz"
      sha256 "96a98b1d5666f2eff6f9d8d539d2e2087141903311f1e848cde477ae8f35979e"
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
      sha256 "3ef00d4f2f6affd700c455234d1e14bd32a088f4aea21b13b4356a04f15409f9"
    else
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_linux_amd64.tar.gz"
      sha256 "fd0eec00e21b0a901473573e3b87e5079bfa40010e61506bca9da0356f74e899"
    end
  end

  def install
    bin.install "sbproxy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sbproxy --version")
  end
end
