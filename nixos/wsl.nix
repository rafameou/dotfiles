# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ lib, pkgs, inputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    #<nixos-wsl/modules>
    ./mod/nix.nix
    ./mod/nixpkgs.nix
    ./mod/desktop.nix
    ./mod/env.nix
    ./mod/time.nix
    ./mod/user.nix
    ./mod/zsh.nix
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  /* ... changes to only this sytem */
  networking.hostName = "wsl"; # Define your hostname.
  home-manager = {
    backupFileExtension = "hm-backup";
    extraSpecialArgs = { inherit inputs /*outputs*/; };
    users = {
      rafameou = import ../home-manager/wsl.nix;
    };
  };

  wsl.enable = true;
  wsl.defaultUser = "rafameou";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";

}
