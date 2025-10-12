class Subtitletools < Formula
  desc "A command-line tool for managing and synchronizing subtitle files"
  homepage "https://github.com/S9yN37/SubtitleTools"
  version "v1.0.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/S9yN37/SubtitleTools/releases/download/v1.0.1/SubtitleTools-v1.0.1-osx-x64.tar.gz"
      sha256 "820b5d58119210166aba2d569b911f7ffd5860290460751481c1a78b5d038300"
    end

    on_arm do
      url "https://github.com/S9yN37/SubtitleTools/releases/download/v1.0.1/SubtitleTools-v1.0.1-osx-arm64.tar.gz"
      sha256 "5bcb09250d13ad3699ddb280c5ed02b685c9bb996ee95ebacd31e63bdc0e2c9f"
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