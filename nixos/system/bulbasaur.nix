{ inputs, pkgs, lib, ... }:
{
  imports = [
    ./mod/base.nix

    ./bulbasaur-hw.nix
    ./mod/boot-grub.nix

    ./mod/sway.nix
  ];

  #nixpkgs.overlays = [(final: prev: { hyprland = prev.hyprland.override { legacyRenderer = true; };})];
  
  /* ... changes to only this sytem */
  networking.hostName = "bulbasaur"; # Define your hostname.
  home-manager = {
    backupFileExtension = "hm-backup";
    extraSpecialArgs = { inherit inputs /*outputs*/; };
    users = {
      rafameou = import ../home-manager/bulbasaur.nix;
    };
  };

  #https://forums.linuxmint.com/viewtopic.php?t=427633
  boot.kernelParams = ["tsc=unstable"];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
