# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class HomebrewUrlo < Formula
  desc "A simple CLI tool to open URLs from the command line"
  homepage "https://github.com/ryo034/homebrew-urlo"
  version "1.0.29"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/ryo034/homebrew-urlo/releases/download/v1.0.29/homebrew-urlo_Darwin_x86_64.tar.gz"
      sha256 "bdf6be2dc67975eaeea62bd6cb6c269147c8bc9b0843ad677eaa3fc5c4a0826f"

      def install
        bin.install "urlo"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/ryo034/homebrew-urlo/releases/download/v1.0.29/homebrew-urlo_Darwin_arm64.tar.gz"
      sha256 "4746d0cb1103486571de42c6e38b6fa981dff2d61e7d5e55ac2b6c251442ba58"

      def install
        bin.install "urlo"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/ryo034/homebrew-urlo/releases/download/v1.0.29/homebrew-urlo_Linux_x86_64.tar.gz"
      sha256 "6a509c3ffea61244901af710b3fc6640db6b74cf7d3ccd3503173a9321f96b68"

      def install
        bin.install "urlo"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ryo034/homebrew-urlo/releases/download/v1.0.29/homebrew-urlo_Linux_arm64.tar.gz"
      sha256 "0930b9a98ff70732b1e409265f0bb7f93237313209f4167f6dbd938bbc8ebdc8"

      def install
        bin.install "urlo"
      end
    end
  end

  test do
    urlo --version
  end
end
