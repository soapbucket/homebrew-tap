class Sbproxy < Formula
  desc "AI gateway and reverse proxy for APIs, MCP, models, and crawlers"
  homepage "https://sbproxy.dev"
  license "Apache-2.0"
  version "1.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_darwin_arm64.tar.gz"
      sha256 "b4c9a75532691a860a8501671832192359ba5548776d78a202d276ff474e619a"
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
      sha256 "81ea866e87454c284d3a012b8283406bc5e3eecb7b740021a46f167d00603e16"
    else
      url "https://github.com/soapbucket/sbproxy/releases/download/v#{version}/sbproxy_linux_amd64.tar.gz"
      sha256 "0f095db8a079d5e6bea24ba21018c86e816f9f74a3703317e103454255398cc0"
    end
  end

  def install
    bin.install "sbproxy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sbproxy --version")
  end
end
