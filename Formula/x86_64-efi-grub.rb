class X8664EfiGrub < Formula
  desc "GRUB2 x86_64-efi modules and image tools, cross-built on macOS"
  homepage "https://www.gnu.org/software/grub/"
  url "https://ftpmirror.gnu.org/gnu/grub/grub-2.12.tar.xz"
  mirror "https://ftp.gnu.org/gnu/grub/grub-2.12.tar.xz"
  sha256 "f3c97391f7c4eaa677a78e090c7e97e6dc47b16f655f04683ebd37bef7fe0faa"
  license "GPL-3.0-or-later"

  depends_on "gawk" => :build
  depends_on "gettext" => :build
  depends_on "pkg-config" => :build
  depends_on "x86_64-elf-binutils" => :build
  depends_on "x86_64-elf-gcc" => :build

  def install
    # The 2.12 tarball references grub-core/extra_deps.lst but does not ship it.
    # It is only cat'd into syminfo.lst, so an empty file is the correct fix.
    touch "grub-core/extra_deps.lst"

    gawk = formula_opt_bin("gawk")/"gawk"

    system "./configure", "--prefix=#{prefix}",
           "--target=x86_64", "--with-platform=efi",
           "--disable-werror",
           "TARGET_CC=x86_64-elf-gcc",
           "TARGET_OBJCOPY=x86_64-elf-objcopy",
           "TARGET_STRIP=x86_64-elf-strip",
           "TARGET_NM=x86_64-elf-nm",
           "TARGET_RANLIB=x86_64-elf-ranlib",
           "AWK=#{gawk}"

    # macOS awk lacks gawk's asorti(), which grub-core/genmoddep.awk needs.
    system "make", "AWK=#{gawk}"
    system "make", "install"
  end

  def caveats
    <<~EOS
      x86_64-efi target only: no BIOS, and grub-install is not usable on macOS.
      Make a self-contained UEFI image with grub-mkstandalone, then copy it to a
      FAT partition as EFI/BOOT/BOOTX64.EFI:

        grub-mkstandalone -O x86_64-efi -o BOOTX64.EFI "boot/grub/grub.cfg=my.cfg"

      Modules install under #{opt_lib}/grub/x86_64-efi (the default image path).
    EOS
  end

  test do
    (testpath/"embedded.cfg").write("echo hello\n")

    system bin/"grub-mkstandalone", "-O", "x86_64-efi",
           "-o", testpath/"BOOTX64.EFI",
           "boot/grub/grub.cfg=#{testpath}/embedded.cfg"

    assert_path_exists testpath/"BOOTX64.EFI"
    assert_match "PE32+", shell_output("file #{testpath}/BOOTX64.EFI")
  end
end
