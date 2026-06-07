class Sbproxy < Formula
  desc "AI Governance Gateway: one self-hostable runtime for AI traffic, APIs, MCP, and crawlers"
  homepage "https://sbproxy.dev"
  license "BUSL-1.1"
  version "1.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_darwin_arm64.tar.gz"
      sha256 "47a513c934b8ebc219b11376da771425937277cf58396d2d26c13c06ccadef7e"
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
      sha256 "979f81c46327196e9cfce0149ca9e9580cac8adc9bb0311241109494c1ddde90"
    else
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_linux_amd64.tar.gz"
      sha256 "705ce95da43a247a53d25804f473de3713cb2c04c18354fd1a3f1f7ec7222850"
    end
  end

  def install
    bin.install "sbproxy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sbproxy --version")
  end
end
