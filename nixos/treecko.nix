# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, lib, config, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./treecko-hw.nix
      ./mod/boot.nix
      ./mod/nix.nix
      ./mod/desktop.nix
      ./mod/ssd.nix
      ./mod/time.nix
      ./mod/user.nix
    ];

  networking.hostName = "treecko"; # Define your hostname.

  # ... changes to only this sytem
  # Enable the MATE Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.mate.enable = true;

  # enable geoclue2 services
  services.geoclue2.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";

}
