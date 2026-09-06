class Sbproxy < Formula
  desc "AI gateway and reverse proxy for APIs, MCP, models, and crawlers"
  homepage "https://sbproxy.dev"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/soapbucket/sbproxy/releases/download/v1.14.0/sbproxy_darwin_arm64.tar.gz"
      sha256 "fdc36df2f976e9eaa48825e3d81b9108d08603bb13c496363aa51b9d72a8a1c1"
    else
      odie <<~EOS
        sbproxy does not ship a native Intel Mac binary.
        Use one of these instead:

          1. Run the linux/amd64 image under Docker:
               docker run --rm soapbucket/sbproxy:1.14.0 --version
          2. Build from source:
               git clone https://github.com/soapbucket/sbproxy
               cd sbproxy && cargo build --release --bin sbproxy
      EOS
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/soapbucket/sbproxy/releases/download/v1.14.0/sbproxy_linux_arm64.tar.gz"
      sha256 "743c2e1cbbfadc3a038d5ff54777338b665075e3ffd14e920ea2f86acd63d552"
    else
      url "https://github.com/soapbucket/sbproxy/releases/download/v1.14.0/sbproxy_linux_amd64.tar.gz"
      sha256 "f1d8108ce65598e99cf1934425f8d7629d3f9fd0f93ef5c6482d7916baba7075"
    end
  end

  def install
    bin.install "sbproxy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sbproxy --version")
  end
end
