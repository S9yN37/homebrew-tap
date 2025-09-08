class Subtitletools < Formula
  desc "A command-line tool for managing and synchronizing subtitle files"
  homepage "https://github.com/S9yN37/SubtitleTools"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/S9yN37/SubtitleTools/releases/download/v1.0.0/SubtitleTools-v1.0.0-osx-x64.tar.gz"
      sha256 "db1c12455796162741e5e85463cfa31b0f4230f5f37057d10dab366959b51e36"
    end

    on_arm do
      url "https://github.com/S9yN37/SubtitleTools/releases/download/v1.0.0/SubtitleTools-v1.0.0-osx-arm64.tar.gz"
      sha256 "ebfb68d74c776974dbf2879562d0e16b57fc6244fcdd427cbf9f9a208ad99592"
    end
  end

  def install
    # Extract binary and rename to SubtitleTools
    bin.install "SubtitleTools" # adjust if binary is inside a folder in tarball

    # Copy config next to binary
    cp "appsettings.json", bin/"appsettings.json"
  end

  test do
    system "#{bin}/SubtitleTools", "--help"
  end
end