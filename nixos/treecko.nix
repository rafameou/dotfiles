# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, lib, config, pkgs, ... }:
{
  imports =
    [ 
      # Include the results of the hardware scan.
      ./treecko-hw.nix
      ./mod/boot.nix
      ./mod/nix.nix
      ./mod/nixpkgs.nix
      ./mod/bluetooth.nix
      ./mod/zsh.nix
      ./mod/desktop.nix
      #./mod/qemu.nix
      #./mod/sway.nix
      ./mod/desktop-environment/kde.nix 
      ./mod/pipewire.nix
      ./mod/ssd.nix
      ./mod/time.nix
      ./mod/user.nix
      ./mod/distrobox.nix
      ./mod/home-manager.nix
      ./mod/env.nix
    ];

  # ... changes to only this sytem
  networking.hostName = "treecko"; # Define your hostname.

  boot.kernelParams = [ "amd_pstate=guided" ];

  services.power-profiles-daemon.enable = false;

  services.tlp = {
    enable = true;
    settings = {
      PLATFORM_PROFILE_ON_BAT = "low-power";
      PLATFORM_PROFILE_ON_AC = "balance";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";

      CPU_SCALING_GOVERNOR_ON_AC="schedutil";
      CPU_SCALING_GOVERNOR_ON_BAT="ondemand";

      START_CHARGE_THRESH_BAT0=75;
      STOP_CHARGE_THRESH_BAT0=80;
    };
  };

  #services.fwupd.enable = true;

  # enable geoclue2 services
  services.geoclue2.enable = true;

  /*services.zerotierone.enable = true;*/

  #console.keyMap = "br-thinkpad";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";

}
