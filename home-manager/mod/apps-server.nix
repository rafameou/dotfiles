{ pkgs, ... }:
{
  imports = [
    ./apps/neovim.nix
    ./apps/kitty.nix
    ./apps/rclone-server.nix
  ]; 

  home.packages = with pkgs; [
    git
    wget
    screen
    firejail
    nodejs_21 figlet cowsay octave
  ];

  /*xdg.configFile = {

  }; */
}
