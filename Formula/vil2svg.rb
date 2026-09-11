class Vil2svg < Formula
  desc "Draw a Vial .vil keymap as an SVG"
  homepage "https://github.com/rgsoda/vil2svg"
  url "https://github.com/rgsoda/vil2svg/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "a8fb03dae6b36ecbbb31339941e82ea5138346ffb3d0b17c45bbfa5cc4eceeb9"
  head "https://github.com/rgsoda/vil2svg.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    # The physical layout is fetched from QMK on first run and cached, so a
    # render needs the network; --help is the offline smoke test.
    assert_match "Draw a Vial", shell_output("#{bin}/vil2svg --help")
  end
end
