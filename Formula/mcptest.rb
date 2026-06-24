# typed: false
# frozen_string_literal: true

class Mcptest < Formula
  desc "Open source CLI for testing Model Context Protocol servers"
  homepage "https://mcptest.sh"
  version "1.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/soapbucket/mcptest/releases/download/v1.1.0/mcptest-1.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "f2e4c8ce1d119802b4866afa126603d2a7eafd3fdcad12aa261aafa053e36c53"
    end
    on_intel do
      url "https://github.com/soapbucket/mcptest/releases/download/v1.1.0/mcptest-1.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "6ca7bd6242fd509cfa3ad958e022381388d9d737c3e933afd04d8f208d80aa6d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/soapbucket/mcptest/releases/download/v1.1.0/mcptest-1.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0a761a2d6e7c9384898b3233ad0c3fcb897c6d8442bd644469e7f8ffcf45a9f2"
    end
    on_intel do
      url "https://github.com/soapbucket/mcptest/releases/download/v1.1.0/mcptest-1.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bef138864860b7dae83f9ecb0d19e00b3692b0a964adbe4146003de3ff059c4a"
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
