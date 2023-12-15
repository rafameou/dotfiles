{ inputs, lib, config, pkgs, ... }:
{
  imports = [
     # Import home-manager's NixOS module
     inputs.home-manager.nixosModules.home-manager
   ];
   home-manager = {
     extraSpecialArgs = { inherit inputs /*outputs*/; };
     users = {
      # Import your home-manager configuration
      rafameou = import ../../home-manager/home.nix;
    };
  };
}
