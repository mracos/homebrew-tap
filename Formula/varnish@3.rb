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

  service do
    run [opt_sbin/"varnishd", "-n", var/"varnish", "-f", etc/"varnish/default.vcl", "-s", "malloc,1G", "-T",
         "127.0.0.1:2000", "-a", "0.0.0.0:8080", "-F"]

    keep_alive true
    working_dir HOMEBREW_PREFIX
    log_path var/"varnish/varnish.log"
    error_log_path var/"varnish/varnish.log"
  end
  
  def caveats; <<~EOS
    You need to add the /usr/local/sbin folder to your path.
  EOS
  end
 
 test do
   assert_match version.to_s, shell_output("#{sbin}/varnishd -V 2>&1")
 end
end 