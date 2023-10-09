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

  boot.kernelParams = [ "amd_pstate=guided" ];

  # ... changes to only this sytem
  # Enable the MATE Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;

  services.power-profiles-daemon.enable = false;

  services.tlp = {
    enable = true;
    settings = {
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";

      CPU_SCALING_GOVERNOR_ON_AC="schedutil";
      CPU_SCALING_GOVERNOR_ON_BAT="ondemand";

      START_CHARGE_THRESH_BAT0=75;
      STOP_CHARGE_TRESH_BAT0=80;
    };
  };

  # enable geoclue2 services
  services.geoclue2.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";

}
