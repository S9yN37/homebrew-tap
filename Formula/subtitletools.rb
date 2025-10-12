class Subtitletools < Formula
  desc "A command-line tool for managing and synchronizing subtitle files"
  homepage "https://github.com/S9yN37/SubtitleTools"
  version "v1.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/S9yN37/SubtitleTools/releases/download/v1.1.0/SubtitleTools-v1.1.0-osx-x64.tar.gz"
      sha256 "a81d816b449569caaa1527f0a8a6e09e6872a89658abeabbe418294b85ab35ff"
    end

    on_arm do
      url "https://github.com/S9yN37/SubtitleTools/releases/download/v1.1.0/SubtitleTools-v1.1.0-osx-arm64.tar.gz"
      sha256 "0cfc44d63bc28a1e21623344ff39e325e241e77849cedf3cdf3126b4cfecbc2c"
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