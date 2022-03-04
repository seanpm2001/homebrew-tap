# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Evcc < Formula
  desc "Sonne tanken ☀️🚘"
  homepage "https://evcc.io"
  version "0.85"
  license "MIT"

  on_macos do
    url "https://github.com/evcc-io/evcc/releases/download/0.85/evcc_0.85_macOS_all.tar.gz"
    sha256 "15198d36861a61e7f7bd2d5f447e514f681991a4367fde0d6b87046ad9dd1f53"

    def install
      bin.install "evcc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/evcc-io/evcc/releases/download/0.85/evcc_0.85_linux_amd64.tar.gz"
      sha256 "f58c367d02296702d9381abe760fcfd896ad89cd099f0f88ec0fd1d878653067"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.85/evcc_0.85_linux_armv6.tar.gz"
      sha256 "33b2a7973bce174e52bd6d5d4456b19322513ed367c727af12069773dd469611"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.85/evcc_0.85_linux_arm64.tar.gz"
      sha256 "ba22482b64e7899c8d8d667938babca9d25a08b4d2b02ec41a7c806de4c1cfbe"

      def install
        bin.install "evcc"
      end
    end
  end

  plist_options :startup => false

  def plist; <<~EOS
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
