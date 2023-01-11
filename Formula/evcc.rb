# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Evcc < Formula
  desc "Sonne tanken ☀️🚘"
  homepage "https://evcc.io"
  version "0.111.1"
  license "MIT"

  on_macos do
    url "https://github.com/evcc-io/evcc/releases/download/0.111.1/evcc_0.111.1_macOS_all.tar.gz"
    sha256 "fb8b3b0de48ae58af0d6b0c7ab379054721c2ce84336b8f1ac3d3dfb3a13a082"

    def install
      bin.install "evcc"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.111.1/evcc_0.111.1_linux_armv6.tar.gz"
      sha256 "6531892ee525006b10e2a2de30f0c10f228bce3d9df9c5a6016bfd4d2c1dd489"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/evcc-io/evcc/releases/download/0.111.1/evcc_0.111.1_linux_amd64.tar.gz"
      sha256 "40116b1bf95b3db135c7821ed20cd6ab2b3610d3f0fb2eadfc5bd138966ab072"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.111.1/evcc_0.111.1_linux_arm64.tar.gz"
      sha256 "f7e6b0dbafe74783ff81d6039f1df93dfb395da8220e99ada47560facebb297e"

      def install
        bin.install "evcc"
      end
    end
  end

  plist_options startup: false

  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>Label</key>
    <string>#{plist_name}</string>
    <key>Program</key>
    <string>#{bin}/evcc</string>
    <key>WorkingDirectory</key>
    <string>#{var}</string>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
    <key>StandardOutPath</key>
    <string>#{var}/log/evcc.log</string>
    <key>StandardErrorPath</key>
    <string>#{var}/log/evcc.log</string>
  </dict>
</plist>

    EOS
  end

  test do
    system "#{bin}/evcc --version"
  end
end
