class Subtitletools < Formula
  desc "A command-line tool for managing and synchronizing subtitle files"
  homepage "https://github.com/S9yN37/SubtitleTools"
  version "v1.0.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/S9yN37/SubtitleTools/releases/download/v1.0.0/SubtitleTools-v1.0.0-osx-x64.tar.gz"
      sha256 "4ad55cde0dba497a1230525fee48bd38d945da81ea6b4e41f7604235f44c09d0"
    end

    on_arm do
      url "https://github.com/S9yN37/SubtitleTools/releases/download/v1.0.0/SubtitleTools-v1.0.0-osx-arm64.tar.gz"
      sha256 "fddb2463307a1b8808645ebcef0226e415932f14693f080496b0abb6dd5c3ce6"
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