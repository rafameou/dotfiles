{ pkgs, ... }:
{
  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.plymouth.enable = true;

  /*
    boot.loader.grub.extraEntries = ''
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
  */
}
