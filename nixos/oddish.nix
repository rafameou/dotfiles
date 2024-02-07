# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, lib, config, pkgs, ... }:
{
  imports =
    [ 
      # Include the results of the hardware scan.
      ./oddish-hw.nix
      ./mod/boot-pi.nix
      ./mod/env.nix
      ./mod/user.nix
      ./mod/home-manager-server.nix
      ./mod/nix.nix
      ./mod/nixpkgs.nix
      ./mod/time.nix
      ./mod/zsh.nix
    ];

  # ... changes to only this sytem
  networking.hostName = "oddish"; # Define your hostname.

  zramSwap.enable = true; # included in ssd.nix

  services.openssh.enable = true;

  services.tailscale.useRoutingFeatures = "both";

  fileSystems."/mnt/Extra" = { 
    device = "/dev/disk/by-uuid/953d1685-a959-499a-a340-b77a5ca058d6";
    fsType = "ext4";
  };

  environment.systemPackages = [
    pkgs.jellyfin
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg
  ];

  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";

}
