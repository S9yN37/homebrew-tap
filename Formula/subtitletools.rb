class Subtitletools < Formula
  desc "A command-line tool for managing and synchronizing subtitle files"
  homepage "https://github.com/S9yN37/SubtitleTools"
  version "v1.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/S9yN37/SubtitleTools/releases/download/v1.1.0/SubtitleTools-v1.1.0-osx-x64.tar.gz"
      sha256 "def86955ac330ae29ffbc981a7458a491c7fc186ad482c216cae80127e6379be"
    end

    on_arm do
      url "https://github.com/S9yN37/SubtitleTools/releases/download/v1.1.0/SubtitleTools-v1.1.0-osx-arm64.tar.gz"
      sha256 "5afc23a9487af6bb3841a12aa7d8d4f523f955d7a798aa149ec6de234a3d5660"
    end
  end

  def install
    # Install the pre-compiled binary and supporting files
    bin.install "SubtitleTools"
    bin.install "appsettings.json"
    bin.install "SubtitleTools.pdb" if build.with?("debug")
  end

  def caveats
    <<~EOS
      macOS may block the binary because it's not signed by an identified developer.
      To allow it, run:
        sudo xattr -dr com.apple.quarantine "$(readlink -f $(which SubtitleTools))"
    EOS
  end

  test do
    system "#{bin}/SubtitleTools", "--help"
  end
end