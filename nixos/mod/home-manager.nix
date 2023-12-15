{ inputs, lib, config, pkgs, ... }:
{
  home-manager = {
    extraSpecialArgs = { inherit inputs /*outputs*/; };
    users = {
      # Import your home-manager configuration
      rafameou = import ../home-manager/home.nix;
    };
  };
}
