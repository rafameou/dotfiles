{ pkgs, inputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./treecko-hw.nix
    ./mod/boot.nix
    ./mod/nix.nix
    ./mod/nixpkgs.nix
    ./mod/bluetooth.nix
    ./mod/zsh.nix
    ./mod/desktop.nix
    ./mod/stylix.nix
    ./mod/qemu.nix 
    ./mod/pipewire.nix
    ./mod/ssd.nix
    ./mod/time.nix
    ./mod/user.nix
    ./mod/distrobox.nix
    ./mod/env.nix
    ./mod/flatpak.nix
    ./mod/desktop-environment/mate.nix
    ./mod/sway.nix
  ];

  /* ... changes to only this sytem */
  networking.hostName = "treecko"; # Define your hostname.
  home-manager = {
    extraSpecialArgs = { inherit inputs /*outputs*/; };
    users = {
      rafameou = import ../home-manager/treecko.nix;
    };
  };

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

  services.geoclue2.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";

}
