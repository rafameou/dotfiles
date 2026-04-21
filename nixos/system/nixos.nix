{ pkgs, inputs, ... }:
{
  imports = [
    ./mod/base.nix

    ./nixos-hw.nix
    ./mod/boot.nix

    ./mod/desktop-environment/kde.nix
  ];

  # ... changes to only this sytem
  networking.hostName = "nixos"; # Define your hostname.
  home-manager = {
    backupFileExtension = "hm-backup";
    extraSpecialArgs = {
      inherit
        inputs # outputs
        ;
    };
    users = {
      rafameou = import ../home-manager/nixos.nix;
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";

}
