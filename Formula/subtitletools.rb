class Subtitletools < Formula
  desc "A command-line tool for managing and synchronizing subtitle files"
  homepage "https://github.com/S9yN37/SubtitleTools"
  version "v1.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/S9yN37/SubtitleTools/releases/download/v1.1.0/SubtitleTools-v1.1.0-osx-x64.tar.gz"
      sha256 "aaa49f6911c85192e5930d71861c709b5d1dece1fd583cbeb21810b379913f25"
    end

    on_arm do
      url "https://github.com/S9yN37/SubtitleTools/releases/download/v1.1.0/SubtitleTools-v1.1.0-osx-arm64.tar.gz"
      sha256 "90d91d426297985e114ba3aa34f5d23947c18d4a9c975ca7713c4e924d47e516"
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
        xattr -dr com.apple.quarantine "$(which subtitletools)"
    EOS
  end

  test do
    system "#{bin}/SubtitleTools", "--help"
  end
end