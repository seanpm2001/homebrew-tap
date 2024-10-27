# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Evcc < Formula
  desc "Sonne tanken ☀️🚘"
  homepage "https://evcc.io"
  version "0.131.2"
  license "MIT"

  on_macos do
    url "https://github.com/evcc-io/evcc/releases/download/0.131.2/evcc_0.131.2_macOS-all.tar.gz"
    sha256 "507b501821e75f2c588d151ab1ba0f30d0cd5ee319619bd6a3e2dd8c8d44362c"

    def install
      bin.install "evcc"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/evcc-io/evcc/releases/download/0.131.2/evcc_0.131.2_linux-amd64.tar.gz"
        sha256 "3e20c3b6aa18423ac5d5e749954125dff00fddee2bb7c85a761de0138dd7c414"

        def install
          bin.install "evcc"
        end
      end
    end
    on_arm do
      if !Hardware::CPU.is_64_bit?
        url "https://github.com/evcc-io/evcc/releases/download/0.131.2/evcc_0.131.2_linux-armv6.tar.gz"
        sha256 "f7a54ea870f500d321fb30a83c6d60ee4581302128fb638aec249b43b57636a8"

        def install
          bin.install "evcc"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/evcc-io/evcc/releases/download/0.131.2/evcc_0.131.2_linux-arm64.tar.gz"
        sha256 "fcb102ac0e33894ccae846e51efe51893cbc95f71cb4359f70bff49ca7ad25d5"

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
