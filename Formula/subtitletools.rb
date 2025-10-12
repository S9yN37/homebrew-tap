class Subtitletools < Formula
  desc "A command-line tool for managing and synchronizing subtitle files"
  homepage "https://github.com/S9yN37/SubtitleTools"
  version "v1.0.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/S9yN37/SubtitleTools/releases/download/v1.0.0/SubtitleTools-v1.0.0-osx-x64.tar.gz"
      sha256 "9d536387228928061f0f8bbdf652d5d73b0ece02a19b1a5d34d64cb8803780eb"
    end

    on_arm do
      url "https://github.com/S9yN37/SubtitleTools/releases/download/v1.0.0/SubtitleTools-v1.0.0-osx-arm64.tar.gz"
      sha256 "3a207df251fdc52ad2d08e88f0070f013f3e97c5bcb324e9c29ef21f945453e7"
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