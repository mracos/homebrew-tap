class VarnishAT3 <Formula 
  url 'http://varnish-cache.org/_downloads/varnish-3.0.2.tgz' 
  homepage 'http://www.varnish-cache.org/' 
  sha256 '973f60625e9690e0989e1bbc73c37ea53fc6291b8f7b03d617b76f8084a4a243' 
 
  depends_on 'pkg-config' => :build 
  depends_on 'pcre' => :build
 
  def install 
    # http://www.varnish-cache.org/trac/wiki/Installation  
    system "./configure", "--disable-dependency-tracking", 
                          "--prefix=#{prefix}", 
                          "--localstatedir=#{var}" 
    system "make" 
    system "make install" 
    
    (etc/"varnish3").install "etc/default.vcl"
    (var/"varnish3").mkpath
  end
 
  plist_options :manual => "#{HOMEBREW_PREFIX}/sbin/varnishd -n #{HOMEBREW_PREFIX}/var/varnish3 -f #{HOMEBREW_PREFIX}/etc/varnish3/default.vcl -s malloc,1G -T 127.0.0.1:2000 -a 0.0.0.0:8080 -F"

  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>org.varnish-cache.varnishd</string>
        <key>ProgramArguments</key>
        <array>
          <string>/usr/local/sbin/varnishd</string>
          <string>-f</string>
          <string>/path/to/varnish.vcl</string>
          <string>-s</string>
          <string>malloc,1G</string>
          <string>-T</string>
          <string>127.0.0.1:2000</string>
          <string>-a</string>
          <string>0.0.0.0:80</string>
        </array>
        <key>KeepAlive</key>
        <true/>
        <key>RunAtLoad</key>
        <true/>
        <key>WorkingDirectory</key>
        <string>/usr/local/sbin</string>
        <key>StandardErrorPath</key>
        <string>/var/log/varnish.log</string>
        <key>StandardOutPath</key>
        <string>/var/log/varnish.log</string>
      </dict>
      </plist>
    EOS
  end
  
  def caveats; <<~EOS
    You need to add the /usr/local/sbin folder to your path.
  EOS
  end
 
 test do
   assert_match version.to_s, shell_output("#{sbin}/varnishd -V 2>&1")
 end
end 