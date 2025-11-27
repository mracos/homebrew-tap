class Aseprite < Formula
  desc "Animated sprite editor and pixel art tool built from source"
  homepage "https://github.com/aseprite/aseprite"
  url "https://github.com/aseprite/aseprite/releases/download/v1.3.15.4/Aseprite-v1.3.15.5-Source.zip"
  sha256 "2402325af2d6b7f663a5f06f728a6d2a1a2053e17cd97afa483b155689a3e9d4"
  license :cannot_represent
  head "https://github.com/aseprite/aseprite.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on macos: :ventura
  depends_on "cmake" => :build
  depends_on "ninja" => :build

  on_arm do
    resource "skia" do
      url "https://github.com/aseprite/skia/releases/download/m124-08a5439a6b/Skia-macOS-Release-arm64.zip"
      sha256 "22663000967fc2c3f1a78190082228474955de02ffd13a352b39a48b204dac9a"
    end
  end

  on_intel do
    resource "skia" do
      url "https://github.com/aseprite/skia/releases/download/m124-08a5439a6b/Skia-macOS-Release-x64.zip"
      sha256 "c11c5fbfa3f8cdefa2255d37cdd1eca823d195ff61929f457a4714f1b6db500a"
    end
  end

  def install
    skia_path = buildpath/"skia"
    resource("skia").stage skia_path

    arch = Hardware::CPU.arm? ? "arm64" : "x64"
    arch_flag = Hardware::CPU.arm? ? "arm64" : "x86_64"
    skia_out = skia_path/"out"/"Release-#{arch}"

    system "cmake", "-S", ".", "-B", "build", "-G", "Ninja", *std_cmake_args,
           "-DCMAKE_BUILD_TYPE=RelWithDebInfo",
           "-DCMAKE_OSX_ARCHITECTURES=#{arch_flag}",
           "-DLAF_BACKEND=skia",
           "-DSKIA_DIR=#{skia_path}",
           "-DSKIA_LIBRARY_DIR=#{skia_out}",
           "-DSKIA_LIBRARY=#{skia_out}/libskia.a"

    system "cmake", "--build", "build", "--target", "aseprite"

    prefix.install "build/bin/Aseprite.app"
    bin.install_symlink prefix/"Aseprite.app/Contents/MacOS/aseprite" => "aseprite"
  end

  def caveats
    <<~EOS
      To launch the GUI, symlink the bundled app into /Applications with:
        ln -s #{opt_prefix}/Aseprite.app /Applications/Aseprite.app

      Removing the formula will not automatically remove that manual link.
      When uninstalling, delete the symlink if it still exists:
        rm -f /Applications/Aseprite.app

      Aseprite stores state in the following locations, which you can remove
      manually to mimic `brew uninstall --zap`:
        ~/Library/Application Support/Aseprite
        ~/Library/Logs/Homebrew/aseprite
        ~/Library/Preferences/Aseprite.plist
        ~/Library/Preferences/org.aseprite.Aseprite.plist
        ~/Library/Saved Application State/org.aseprite.Aseprite.savedState
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aseprite --version")
  end
end
