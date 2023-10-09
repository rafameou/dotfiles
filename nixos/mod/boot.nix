{ inputs, lib, config, pkgs, ... }:
{
  # Bootloader.
  boot.loader.systemd-boot.enable = true; #lib.mkForce false; #true;
  #boot.lanzaboote = {
  #  enable = true;
  #  pkiBundle = "/etc/secureboot";
  #};
  boot.loader.efi.canTouchEfiVariables = true;
  boot.bootspec.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
