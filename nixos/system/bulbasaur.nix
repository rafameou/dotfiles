{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./mod/base.nix

    ./bulbasaur-hw.nix
    ./mod/boot-grub.nix

    ./mod/greetd.nix
    ./mod/desktop-environment/lxqt.nix
    ./mod/sway.nix
    ./mod/niri.nix
  ];

  #nixpkgs.overlays = [(final: prev: { hyprland = prev.hyprland.override { legacyRenderer = true; };})];

  # ... changes to only this sytem
  networking.hostName = "bulbasaur"; # Define your hostname.
  home-manager = {
    backupFileExtension = "hm-backup";
    extraSpecialArgs = {
      inherit
        inputs # outputs
        ;
    };
    users = {
      rafameou = import ../home-manager/bulbasaur.nix;
    };
  };

  fileSystems = {
    "/mnt/Extra" = {
      device = "/dev/disk/by-uuid/478603e4-74ea-444d-b1aa-e1c49f54853d";
      fsType = "ext4";
      options = [
        "x-gvfs-show"
        "nofail"
        "exec"
      ];
    };
  };

  programs.steam = {
    enable = true;
    extraPackages = with pkgs; [
      gamescope
      steamtinkerlaunch
    ];
  };

  #https://forums.linuxmint.com/viewtopic.php?t=427633
  boot.kernelParams = [ "tsc=unstable" ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
