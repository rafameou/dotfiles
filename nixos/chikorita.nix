# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, lib, config, pkgs, ... }:
{
  imports =
    [ 
      # Include the results of the hardware scan.
      ./chikorita-hw.nix
      ./mod/boot.nix
      ./mod/nix.nix
      ./mod/nixpkgs.nix
      ./mod/zsh.nix
      ./mod/bluetooth.nix
      ./mod/desktop.nix
      ./mod/qemu.nix
      ./mod/sway.nix
      ./mod/pipewire.nix
      ./mod/nvidia-hell.nix
      ./mod/ssd.nix
      ./mod/time.nix
      ./mod/user.nix
      ./mod/distrobox.nix
      ./mod/home-manager.nix
      ./mod/env.nix
    ];

    networking.hostName = "chikorita"; # Define your hostname.

  # ... changes to only this sytem

  fileSystems."/mnt/Extra" =
    { 
      device = "/dev/disk/by-uuid/41785370-fb0f-4504-81a2-d9bf1b895fb5";
      fsType = "ext4";
    };

  # enable geoclue2 services
  services.geoclue2.enable = true;

  #services.zerotierone.enable = true;
  #services.openssh.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";

}
