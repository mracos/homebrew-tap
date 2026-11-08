class ReviewManFork < Formula
  desc "Fork of review-man with an inbox, bulk viewed marks, find and PR actions"
  homepage "https://github.com/mracos/review-man"
  # Pinned to the fork's main, versioned by the commit date; --HEAD follows main.
  url "https://github.com/mracos/review-man/archive/d134764b219e9b74a8ed5ffc679bf907a4c539c2.tar.gz"
  version "0.0.0-20261108"
  sha256 "17e1e663baa8e91a83f8266c9c607dfae8348848fdd70364d15e3900bd91b2d4"
  license "MIT"
  head "https://github.com/mracos/review-man.git", branch: "main"

  livecheck do
    skip "No tagged releases"
  end

  depends_on xcode: ["16.3", :build]
  depends_on arch: :arm64
  depends_on "gh"
  depends_on macos: :ventura

  conflicts_with "review-man", because: "both install PR Review.app and the pr-review launcher"

  def install
    # Mirrors scripts/build-app, which can't run here: its own `swift build`
    # trips over the Homebrew sandbox without --disable-sandbox.
    system "swift", "build", "--disable-sandbox", "--configuration", "release",
           "--product", "PRReviewApp"
    system "swift", "build", "--disable-sandbox", "--configuration", "release",
           "--product", "pr-review"
    bin_path = Utils.safe_popen_read("swift", "build", "--configuration", "release", "--show-bin-path").chomp

    app = buildpath/"PR Review.app"
    (app/"Contents/MacOS").install "#{bin_path}/PRReviewApp"
    (app/"Contents").install "PRReviewApp/Resources/Info.plist"
    system "plutil", "-replace", "CFBundleExecutable", "-string", "PRReviewApp", app/"Contents/Info.plist"
    system "plutil", "-replace", "CFBundleIdentifier", "-string", "com.prreview.app", app/"Contents/Info.plist"

    iconset = buildpath/"AppIcon.iconset"
    cp_r "PRReviewApp/Resources/Assets.xcassets/AppIcon.appiconset", iconset
    rm iconset/"Contents.json"
    (app/"Contents/Resources").mkpath
    system "iconutil", "--convert", "icns", "--output", app/"Contents/Resources/AppIcon.icns", iconset

    system "codesign", "--force", "--sign", "-", app
    prefix.install app
    bin.install "#{bin_path}/pr-review"
  end

  def caveats
    <<~EOS
      To launch the app from Spotlight/Finder, link it into ~/Applications:
        ln -sf "#{opt_prefix}/PR Review.app" ~/Applications/

      Open it once so macOS registers the pr-review:// URL scheme, which
      `pr-review <pr-ref>` relies on. Remove the link on uninstall.
    EOS
  end

  test do
    assert_match "desktop launcher for PR Review", shell_output("#{bin}/pr-review --help")
  end
end
