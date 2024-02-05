{ inputs, lib, config, pkgs, ... }:
{
  imports = [
    ./apps/neovim.nix
    ./apps/kitty.nix
  ]; 

  home.packages = with pkgs; [
    git
    wget
    screen
    nodejs_21 
  ];

  /*xdg.configFile = {

  }; */
}
