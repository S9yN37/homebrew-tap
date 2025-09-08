class SubtitleTools < Formula
  desc "A command-line tool for managing and synchronizing subtitle files"
  homepage "https://github.com/S9yN37/SubtitleTools"
  url "https://github.com/S9yN37/SubtitleTools/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "b879a2bc19b77dd3aefe5ef43504cff0b184e44c641853631ae00f58e70517c3"
  version "1.0.0"
  license "MIT"

  depends_on "python@3.12" # or other dependencies

  def install
    system "python3", *Language::Python.setup_install_args(prefix)
  end

  test do
    system "#{bin}/SubtitleTools", "--help"
  end
end