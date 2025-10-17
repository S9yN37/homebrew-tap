class Subtitletools < Formula
  desc "A command-line tool for managing and synchronizing subtitle files"
  homepage "https://github.com/S9yN37/SubtitleTools"
  version "v1.1.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/S9yN37/SubtitleTools/releases/download/v1.1.1/SubtitleTools-v1.1.1-osx-x64.tar.gz"
      sha256 "0d7ea95009fb1757ed4adadcdcaae6ecea805e02ed0fa94604f0b6280bf96119"
    end

    on_arm do
      url "https://github.com/S9yN37/SubtitleTools/releases/download/v1.1.1/SubtitleTools-v1.1.1-osx-arm64.tar.gz"
      sha256 "f3f5b9d4394cf3f77b56acacfa54761cb8b9afe41f350d526b2f8c16cf0edb2e"
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