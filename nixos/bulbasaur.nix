# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, lib, config, pkgs, ... }:
{
  imports =
    [ 
      # Include the results of the hardware scan.
      ./bulbasaur-hw.nix
      ./mod/boot-grub.nix
      ./mod/nix.nix
      ./mod/nixpkgs.nix
      ./mod/bluetooth.nix
      ./mod/desktop.nix
      ./mod/sway.nix
      ./mod/pipewire.nix
      #./mod/ssd.nix
      ./mod/time.nix
      ./mod/user.nix
      ./mod/distrobox.nix
      ./mod/home-manager.nix
      ./mod/env.nix
    ];

  # ... changes to only this sytem
  networking.hostName = "bulbasaur"; # Define your hostname.

  # enable geoclue2 services
  services.geoclue2.enable = true;

  /*services.zerotierone.enable = true;*/

  #console.keyMap = "br-thinkpad";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
