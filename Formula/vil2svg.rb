class Vil2svg < Formula
  desc "Draw a Vial .vil keymap as an SVG"
  homepage "https://github.com/rgsoda/vil2svg"
  url "https://github.com/rgsoda/vil2svg/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "4347730205f20b591178ec50f7de81d0d9fcbafcc3f68922d3e4ce3c42b83fff"
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
