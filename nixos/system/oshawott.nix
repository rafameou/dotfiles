{ pkgs, inputs, ... }:
{
  imports = [
    ./mod/base.nix

    ./oshawott-hw.nix
    ./mod/boot.nix

    ./mod/desktop-environment/xfce.nix
    ./mod/greetd.nix
    ./mod/sway.nix
    #./mod/niri.nix
    ./mod/labwc.nix
    ./mod/wayfire.nix
  ];

  # ... changes to only this sytem
  networking.hostName = "oshawott"; # Define your hostname.
  home-manager = {
    backupFileExtension = "hm-backup";
    extraSpecialArgs = {
      inherit
        inputs # outputs
        ;
    };
    users = {
      rafameou = import ../home-manager/oshawott.nix;
    };
  };

  programs.steam = {
    enable = true;
    extraPackages = with pkgs; [
      gamescope
      steamtinkerlaunch
    ];
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";

}
