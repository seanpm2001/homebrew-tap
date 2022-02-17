# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Evcc < Formula
  desc "Sonne tanken ☀️🚘"
  homepage "https://evcc.io"
  version "0.83"
  license "MIT"

  on_macos do
    url "https://github.com/evcc-io/evcc/releases/download/0.83/evcc_0.83_macOS_all.tar.gz"
    sha256 "81d00f0650966837b52536ba08ce68566116f55a41c66f37761dadc00df985a6"

    def install
      bin.install "evcc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/evcc-io/evcc/releases/download/0.83/evcc_0.83_linux_amd64.tar.gz"
      sha256 "a0461596689b7db50ecc9f95bc85349991e0af43fe9baee77d812c7c68e19944"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.83/evcc_0.83_linux_arm64.tar.gz"
      sha256 "c52440a183e29a9950a6a4ab2eadb0a8edafdfc0caf612dbf7f1eca624a5cedc"

      def install
        bin.install "evcc"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/evcc-io/evcc/releases/download/0.83/evcc_0.83_linux_armv6.tar.gz"
      sha256 "6db028a478b7eb823aaeb8f5f94f5da9dc547d347cb9909a4dbfa7a7c7c3cf0b"

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
