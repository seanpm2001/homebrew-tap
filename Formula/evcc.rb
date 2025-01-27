# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Evcc < Formula
  desc "Sonne tanken ☀️🚘"
  homepage "https://evcc.io"
  version "0.132.0"
  license "MIT"

  on_macos do
    url "https://github.com/evcc-io/evcc/releases/download/0.132.0/evcc_0.132.0_macOS-all.tar.gz"
    sha256 "6d4dc6f8b5989c8434b0529bd9615acaa5aaa5b2ccbad2adabd7b54276c2bd91"

    def install
      bin.install "evcc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/evcc-io/evcc/releases/download/0.132.0/evcc_0.132.0_linux-amd64.tar.gz"
        sha256 "67818d29820b36c113e7f802e1792c3e7de7c84d65a942a4468dc4ff9f64f0b9"

        def install
          bin.install "evcc"
        end
      end
    end
    if Hardware::CPU.arm?
      if !Hardware::CPU.is_64_bit?
        url "https://github.com/evcc-io/evcc/releases/download/0.132.0/evcc_0.132.0_linux-armv6.tar.gz"
        sha256 "3139082e217b046393b7b0b6ec829d270f05cd4ba0b779c4b971869518894750"

        def install
          bin.install "evcc"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/evcc-io/evcc/releases/download/0.132.0/evcc_0.132.0_linux-arm64.tar.gz"
        sha256 "89969f8c4c51ddb1c5fc1de6b8a77887f3f5567ca15274c18587114022da3985"

        def install
          bin.install "evcc"
        end
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
