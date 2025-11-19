class Subtitletools < Formula
  desc "A command-line tool for managing and synchronizing subtitle files"
  homepage "https://github.com/S9yN37/SubtitleTools"
  version "v1.1.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/S9yN37/SubtitleTools/releases/download/v1.1.3/SubtitleTools-v1.1.3-osx-x64.tar.gz"
      sha256 "47c54aa35aaa571e5da625188fd4382fd82bfe4e06b7b4211fa69a5f3133bdbf"
    end

    on_arm do
      url "https://github.com/S9yN37/SubtitleTools/releases/download/v1.1.3/SubtitleTools-v1.1.3-osx-arm64.tar.gz"
      sha256 "d311617e4bc07f020d541650be0a0f422133e1c859c95113c31277e7fb526f6c"
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