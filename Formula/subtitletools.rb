class Subtitletools < Formula
  desc "A command-line tool for managing and synchronizing subtitle files"
  homepage "https://github.com/S9yN37/SubtitleTools"
  version "v1.1.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/S9yN37/SubtitleTools/releases/download/v1.1.1/SubtitleTools-v1.1.1-osx-x64.tar.gz"
      sha256 "ea3cb47ddab78ec6c23ebe4fcd90ba4f979717898f3e0fde9493dab125079d7b"
    end

    on_arm do
      url "https://github.com/S9yN37/SubtitleTools/releases/download/v1.1.1/SubtitleTools-v1.1.1-osx-arm64.tar.gz"
      sha256 "c2f91c4391152e1789621d7c357938f7f86a1e6f0b1f95caa90aebe01c4751b0"
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