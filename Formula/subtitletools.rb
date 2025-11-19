class Subtitletools < Formula
  desc "A command-line tool for managing and synchronizing subtitle files"
  homepage "https://github.com/S9yN37/SubtitleTools"
  version "v1.1.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/S9yN37/SubtitleTools/releases/download/v1.1.3/SubtitleTools-v1.1.3-osx-x64.tar.gz"
      sha256 "027111b21c705db00ec2a838bbb0daf2e8b924f112ab1151226be997b4740267"
    end

    on_arm do
      url "https://github.com/S9yN37/SubtitleTools/releases/download/v1.1.3/SubtitleTools-v1.1.3-osx-arm64.tar.gz"
      sha256 "be308194e25099591b5951cdf0a5b79047b216965b9694567ed57129e0ce4e1c"
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