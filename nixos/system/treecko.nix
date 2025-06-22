{ pkgs, inputs, ... }:
{
  imports = [
    ./mod/base.nix

    ./treecko-hw.nix
    ./mod/boot.nix

    ./mod/greetd.nix
    ./mod/desktop-environment/lxqt.nix
    ./mod/sway.nix
    ./mod/tlp.nix
    ./mod/niri.nix
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

  environment.systemPackages = [
    pkgs.android-studio
    pkgs.android-studio-tools
    pkgs.dart
    pkgs.flutterPackages-source.stable
    pkgs.flutter
  ];

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

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";

}
