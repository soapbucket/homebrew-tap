# typed: false
# frozen_string_literal: true

# Homebrew formula for mcptest. Updated on each release from
# soapbucket/mcptest examples/homebrew-tap/Formula/mcptest.rb.tmpl.

class Mcptest < Formula
  desc "Open source CLI for testing Model Context Protocol servers"
  homepage "https://mcptest.sh"
  version "1.0.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/soapbucket/mcptest/releases/download/v1.0.0/mcptest-1.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "1dbc20ccb5e739b1458d54eef54f250ae584117238028f11a071f39b0b198498"
    end
    on_intel do
      url "https://github.com/soapbucket/mcptest/releases/download/v1.0.0/mcptest-1.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "3a10032dec2eb5f62ab069f250784ef3a981f9efb200bb8ceaf4c59f97a5b7df"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/soapbucket/mcptest/releases/download/v1.0.0/mcptest-1.0.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "12e6017a530ba49aed1976b180bec9fffb7f4816f419d23e7ea6401674ef4ac0"
    end
    on_intel do
      url "https://github.com/soapbucket/mcptest/releases/download/v1.0.0/mcptest-1.0.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a2e4ce00e84b65aeb29b9356e4eaddbea37df3ad2f3fcdafdc8638f28e721807"
    end
  end

  def install
    bin.install "mcptest"
    pkgshare.install "NOTICE" if File.exist?("NOTICE")
    pkgshare.install "LICENSE" if File.exist?("LICENSE")
  end

  test do
    assert_match "mcptest", shell_output("#{bin}/mcptest --version")
  end
end
