{ pkgs, inputs, ... }:
{
  imports = [
    ./mod/base.nix

    ./treecko-hw.nix
    ./mod/boot.nix

    ./mod/desktop-environment/lxqt.nix
    ./mod/sway.nix
    ./mod/tlp.nix
    ./mod/niri.nix
  ];

  /* ... changes to only this sytem */
  networking.hostName = "treecko"; # Define your hostname.
  home-manager = {
    backupFileExtension = "hm-backup";
    extraSpecialArgs = { inherit inputs /*outputs*/; };
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
      device = "/dev/disk/by-uuid/8ca22250-372a-4fd4-9a98-0c4a362bbeba";
      fsType = "ext4";
      options = [
        "x-gvfs-show"
        "nofail"
        "exec"
      ];
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";

}
