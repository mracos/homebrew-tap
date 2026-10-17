class ReviewMan < Formula
  desc "Native macOS app for reviewing GitHub pull requests via the gh CLI"
  homepage "https://github.com/namuan/review-man"
  # No tagged releases upstream: pinned to a reviewed commit, versioned by its date.
  url "https://github.com/namuan/review-man/archive/6d768c19f1a0fb587a815c7e0623da1ca43d6fad.tar.gz"
  version "0.0.0-20260915"
  sha256 "7b3eea35e5724799692e22ac62c7cb3a08c5129e545b4589cc31901b8ba9a3ac"
  license "MIT"
  head "https://github.com/namuan/review-man.git", branch: "main"

  livecheck do
    skip "No tagged releases"
  end

  depends_on xcode: ["16.3", :build]
  depends_on arch: :arm64
  depends_on "gh"
  depends_on macos: :ventura

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
