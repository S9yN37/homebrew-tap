class Subtitletools < Formula
  desc "A command-line tool for managing and synchronizing subtitle files"
  homepage "https://github.com/S9yN37/SubtitleTools"
  version "v1.0.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/S9yN37/SubtitleTools/releases/download/v1.0.1/SubtitleTools-v1.0.1-osx-x64.tar.gz"
      sha256 "dc9f584f8a42039d290259dd3e936637d968172a0c11c6a99bc1e5a36da153d4"
    end

    on_arm do
      url "https://github.com/S9yN37/SubtitleTools/releases/download/v1.0.1/SubtitleTools-v1.0.1-osx-arm64.tar.gz"
      sha256 "57b662f385dd7a511e47cb6c8b34e5939767b5533275c40dfe1e128fff036615"
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