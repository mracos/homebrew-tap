cask "octave-app" do
  arch arm: "aarch64", intel: "x86-64"
  url_suffix = on_arch_conditional intel: "-intel"

  version "9.2"
  sha256 arm:          "94cf4ea473cc1ea5d0d6991bd40b13c6a0519841a42eec514b7b5200e865d799",
         intel:        "fe927dcc37c791b4eb6ce31a180500090031db25e1d98111fa32f637d2dc607b",
         arm64_linux:  "0",
         x86_64_linux: "0"

  url "https://github.com/octave-app/octave-app/releases/download/v#{version}/Octave-#{version}#{url_suffix}.dmg"
  name "Octave.app"
  homepage "https://octave-app.org/"

  livecheck do
    url "https://github.com/octave-app/octave-app"
    strategy :github_releases
  end

  app_name = "Octave-#{version}.app"
  depends_on macos: :monterey

  app app_name
  binary "#{appdir}/#{app_name}/Contents/Resources/usr/bin/octave"

  # fix hardcoded perl for texinfo
  # also see: https://github.com/octave-app/octave-app/issues/245
  postflight_steps do
    run "/usr/bin/find",
        args: ["{{appdir}}/Octave-{{version}}.app/Contents/Resources/usr/opt/texinfo/bin",
               "-type", "f",
               "-exec", "/usr/bin/sed", "-i", "", "s|#!/usr/bin/perl5\\.30|#!/usr/bin/perl|g", "{}", "+"]
  end
end
