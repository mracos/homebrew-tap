require 'formula'                                                                                                                                                                              
 
class VarnishAT3 <Formula 
  url 'http://varnish-cache.org/_downloads/varnish-3.0.2.tgz' 
  homepage 'http://www.varnish-cache.org/' 
  sha256 '973f60625e9690e0989e1bbc73c37ea53fc6291b8f7b03d617b76f8084a4a243' 
 
  depends_on 'pkg-config' => :build 
  depends_on 'pcre' => :build 

  # needs 
  skip_clean :all 
 
  def install 
    # http://www.varnish-cache.org/trac/wiki/Installation 
    # system "./autogen.sh" 
    system "./configure", "--enable-debugging-symbols", 
                          "--enable-developer-warnings", 
                          "--enable-dependency-tracking", 
                          "--disable-dependency-tracking", 
                          "--prefix=#{prefix}", 
                          "--localstatedir=#{var}" 
    system "make" 
    system "make install" 
    (var+'varnish3').mkpath 

    (prefix+'org.varnish-cache.varnishd.plist').write startup_plist
    (prefix+'org.varnish-cache.varnishd.plist').chmod 0644
  end

  def startup_plist; <<-EOPLIST
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
    EOPLIST
  end
end 