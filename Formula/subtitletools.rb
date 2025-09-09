class Subtitletools < Formula
  desc "A command-line tool for managing and synchronizing subtitle files"
  homepage "https://github.com/S9yN37/SubtitleTools"
  version "v1.0.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/S9yN37/SubtitleTools/releases/download/v1.0.0/SubtitleTools-v1.0.0-osx-x64.tar.gz"
      sha256 "cd82b4470ab732e1e5be6721f722e53c37604e79a55eb11a3619a2047ec73b8e"
    end

    on_arm do
      url "https://github.com/S9yN37/SubtitleTools/releases/download/v1.0.0/SubtitleTools-v1.0.0-osx-arm64.tar.gz"
      sha256 "1c25bf86d6db9433dcae42ea368500c8901c33b931ed9b012bfe0f182603f3c5"
    end
  end

  def install
    # Install the pre-compiled binary and supporting files
    bin.install "SubtitleTools"
    bin.install "appsettings.json"
    bin.install "SubtitleTools.pdb" if build.with?("debug")
  end

  test do
    system "#{bin}/SubtitleTools", "--help"
  end
end