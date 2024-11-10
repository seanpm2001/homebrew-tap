# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Evcc < Formula
  desc "Sonne tanken ☀️🚘"
  homepage "https://evcc.io"
  version "0.131.5"
  license "MIT"

  on_macos do
    url "https://github.com/evcc-io/evcc/releases/download/0.131.5/evcc_0.131.5_macOS-all.tar.gz"
    sha256 "c5c8e418fbeed327ffd1211a77ed8da7d3461d0b40d3907554dee8820780ac80"

    def install
      bin.install "evcc"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/evcc-io/evcc/releases/download/0.131.5/evcc_0.131.5_linux-amd64.tar.gz"
        sha256 "1f71f925b06de1fb7bddd1b3c104c835783a70b20ed715dcbf7c7881c82d12bf"

        def install
          bin.install "evcc"
        end
      end
    end
    on_arm do
      if !Hardware::CPU.is_64_bit?
        url "https://github.com/evcc-io/evcc/releases/download/0.131.5/evcc_0.131.5_linux-armv6.tar.gz"
        sha256 "daaf8ff05003fbe7d429c882df217adcbf76d32bb07038ee69e1dafbb065c4d4"

        def install
          bin.install "evcc"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/evcc-io/evcc/releases/download/0.131.5/evcc_0.131.5_linux-arm64.tar.gz"
        sha256 "6dd64c015c153b1ff4e326f4b14e05a3c2e9b5fe7d1dd377db761bcf4caa2106"

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
