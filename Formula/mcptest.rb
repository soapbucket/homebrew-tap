# typed: false
# frozen_string_literal: true

class Mcptest < Formula
  desc "Open source CLI for testing Model Context Protocol servers"
  homepage "https://mcptest.sh"
  version "1.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/soapbucket/mcptest/releases/download/v1.2.0/mcptest-1.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "66eac892a4c236a8c06e30c78f628fb3e060edb84b84e97ceee9f42ca98f26c3"
    end
    on_intel do
      url "https://github.com/soapbucket/mcptest/releases/download/v1.2.0/mcptest-1.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "ca508672e42381b1bddd74d98601468df9e9b694278a418bd56436fe0206fff7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/soapbucket/mcptest/releases/download/v1.2.0/mcptest-1.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "230ddfa13148fe337406b1e631c1be46b6ed32f9bf3352e189a254f56fec6a8c"
    end
    on_intel do
      url "https://github.com/soapbucket/mcptest/releases/download/v1.2.0/mcptest-1.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b79940147af016a6a3a28e65b3556fcd61e4887ccadf14a7f66b8379a80b1239"
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
