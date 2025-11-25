{ pkgs, ... }:
{
  # Bootloader.
  boot = {
    loader = {
      systemd-boot.enable = true; # lib.mkForce false; #true;
      efi.canTouchEfiVariables = true;
      timeout = 0;
    };
    #lanzaboote = {
    #  enable = true;
    #  pkiBundle = "/etc/secureboot";
    #};
    bootspec.enable = true;
    kernelPackages = pkgs.linuxPackages_latest;
    plymouth.enable = true;
  };
}
