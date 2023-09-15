# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, lib, config, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./chikorita-hw.nix
      ./mod/boot.nix
      ./mod/nix.nix
      ./mod/desktop.nix
      ./mod/nvidia-hell.nix
      ./mod/ssd.nix
      ./mod/time.nix
      ./mod/user.nix
    ];

  networking.hostName = "chikorita"; # Define your hostname.

  # ... changes to only this sytem

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";

}
