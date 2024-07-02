{ pkgs, ... }:
{
  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = false;
  boot.kernelPackages = pkgs.linuxPackages_cachyos;#_latest;

  boot.loader.grub.extraEntries = ''
menuentry 'Windows 10' --class windows {
	insmod part_msdos
	insmod ntfs
	set root='hd1,msdos1'
	parttool ${"$"}{root} hidden-
	drivemap -s (hd0) ${"$"}{root}
	chainloader +1
}

menuentry 'Windows XP' --class windows {
	insmod part_msdos
	insmod ntfs
        insmod ntldr
        set root='hd1,msdos1'
	parttool ${"$"}{root} hidden-
	drivemap -s (hd0) ${"$"}{root}
	ntldr /ntldr
}
  '';
}
