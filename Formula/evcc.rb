# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Evcc < Formula
  desc "Sonne tanken ☀️🚘"
  homepage "https://evcc.io"
  version "0.124.10"
  license "MIT"

  on_macos do
    url "https://github.com/evcc-io/evcc/releases/download/0.124.10/evcc_0.124.10_macOS-all.tar.gz"
    sha256 "7e49cf2b7ba98a625b9624102b4fc4fe31a058ae804aa19d3660418f45867507"

    def install
      bin.install "evcc"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.124.10/evcc_0.124.10_linux-armv6.tar.gz"
      sha256 "c24ba80872557343b1544946bb00f7cfc46afc9a3a1d8b70722a0a164a02352b"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.124.10/evcc_0.124.10_linux-arm64.tar.gz"
      sha256 "9e0dc937c64819c4a7554f5f5bd86dc2145378e762e30563fb7a099bf48d7d35"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/evcc-io/evcc/releases/download/0.124.10/evcc_0.124.10_linux-amd64.tar.gz"
      sha256 "8df431d05e53f72571ce2f7829e81bd365a6645d1693a4e9415a2c6e65424a8b"

      def install
        bin.install "evcc"
      end
    end
  end

  service do
    run [opt_bin/"evcc"]
    working_dir HOMEBREW_PREFIX
    keep_alive true
    log_path var/"log/evcc.log"
    error_log_path var/"log/evcc.log"
  end

  test do
    system "#{bin}/evcc --version"
  end
end
