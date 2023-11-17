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
      ./mod/bluetooth.nix
      ./mod/desktop.nix
      ./mod/kde.nix
      ./mod/pipewire.nix
      ./mod/ssd.nix
      ./mod/time.nix
      ./mod/user.nix
    ];

  # ... changes to only this sytem
  networking.hostName = "treecko"; # Define your hostname.

  boot.kernelParams = [ "amd_pstate=guided" ];

  services.power-profiles-daemon.enable = false;

  services.tlp = {
    enable = true;
    settings = {
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";

      CPU_SCALING_GOVERNOR_ON_AC="schedutil";
      CPU_SCALING_GOVERNOR_ON_BAT="ondemand";

      START_CHARGE_THRESH_BAT0=75;
      STOP_CHARGE_THRESH_BAT0=80;
    };
  };

  services.fwupd.enable = true;
  
  #sway.nix
  security.polkit.enable = true;
  security.pam.services.swaylock = {};

  # enable geoclue2 services
  services.geoclue2.enable = true;

  services.zerotierone.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";

}
