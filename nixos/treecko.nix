{ pkgs, inputs, ... }:
{
  imports = [
    ./mod/base.nix

    ./treecko-hw.nix
    ./mod/boot.nix

    ./mod/tlp.nix
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

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";

}
