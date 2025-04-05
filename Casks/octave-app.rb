cask "octave-app" do
  version "9.2"
  arch arm: "aarch64", intel: "x86-64"

  url_suffix = on_arch_conditional arm: "", intel: "-intel"
  sha256 arm: "94cf4ea473cc1ea5d0d6991bd40b13c6a0519841a42eec514b7b5200e865d799",
         intel: "fe927dcc37c791b4eb6ce31a180500090031db25e1d98111fa32f637d2dc607b",
         arm64_linux: "",
         x86_64_linux: ""

  url "https://github.com/octave-app/octave-app/releases/download/v#{version}/Octave-#{version}#{url_suffix}.dmg"
  name "Octave.app"
  homepage "https://octave-app.org"

  livecheck do
    url "https://github.com/octave-app/octave-app"
    strategy :github_releases
  end

  app_name = "Octave-#{version}.app"
  app app_name
  binary "#{appdir}/#{app_name}/Contents/Resources/usr/bin/octave"

  # fix hardcoded perl for texinfo
  # also see: https://github.com/octave-app/octave-app/issues/245
  postflight do
    Dir.glob("#{appdir}/#{app_name}/Contents/Resources/usr/opt/texinfo/bin/*").each do |file|
      next unless File.file?(file)
      inreplace file, "#!/usr/bin/perl5.30", "#!/usr/bin/perl"
    end
  end
end
