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

  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud28;
    hostName = "localhost";
    config.adminpassFile = "~/.nextcloud";
  };

  /*xdg.configFile = {

  }; */
}
