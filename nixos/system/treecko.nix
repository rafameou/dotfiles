{ pkgs, inputs, ... }:
{
  imports = [
    ./mod/base.nix

    ./treecko-hw.nix
    ./mod/boot.nix

    ./mod/desktop-environment/xfce.nix
    ./mod/greetd.nix
    ./mod/sway.nix
    ./mod/niri.nix
    ./mod/labwc.nix
    
    ./mod/tlp.nix
  ];

  # ... changes to only this sytem
  networking.hostName = "treecko"; # Define your hostname.
  home-manager = {
    backupFileExtension = "hm-backup";
    extraSpecialArgs = {
      inherit
        inputs # outputs
        ;
    };
    users = {
      rafameou = import ../home-manager/treecko.nix;
    };
  };

  boot.kernelParams = [ "amd_pstate=guided" ];

  programs.steam = {
    enable = true;
    extraPackages = with pkgs; [
      gamescope
      steamtinkerlaunch
    ];
  };

  fileSystems = {
    "/mnt/Extra" = {
      device = "/dev/disk/by-uuid/976df785-2a12-4187-b420-41576584e897";
      fsType = "ext4";
      options = [
        "x-gvfs-show"
        "nofail"
        "exec"
      ];
    };
  };

  services.ollama.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";

}
