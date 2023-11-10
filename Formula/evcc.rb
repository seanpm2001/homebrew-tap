# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Evcc < Formula
  desc "Sonne tanken ☀️🚘"
  homepage "https://evcc.io"
  version "0.122.1"
  license "MIT"

  on_macos do
    url "https://github.com/evcc-io/evcc/releases/download/0.122.1/evcc_0.122.1_macOS-all.tar.gz"
    sha256 "85877556fb12271400cfb061e5022138ac01f56023225f9f11e30a9c8f484f4f"

    def install
      bin.install "evcc"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.122.1/evcc_0.122.1_linux-armv6.tar.gz"
      sha256 "3b96676f8f952adfecbf89e2cf382a61ffec026260291ada2673866a73b90d86"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/evcc-io/evcc/releases/download/0.122.1/evcc_0.122.1_linux-amd64.tar.gz"
      sha256 "337195548df948ca4458f6f8ea598f7f7a851359ae208c19443ab81a24caa5e1"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.122.1/evcc_0.122.1_linux-arm64.tar.gz"
      sha256 "2a13d154e668242d0f9acdc7f53e56e5ee4a974c17376d2e60ce0d6e8cf344c3"

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
