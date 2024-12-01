{ pkgs, ... }:
{
  imports = [
    ./separated/liferea.nix
    #./separated/luakit.nix
    ./separated/qutebrowser.nix
  ];
  programs = {
    firefox = {
      enable = true; 
      #package = pkgs.floorp;
      /*nativeMessagingHosts = with pkgs; [
        firefoxpwa
      ];*/
    };
  };
  home.packages = with pkgs; [
    #thunderbird-128
    google-chrome 
    telegram-desktop
    vesktop
    zapzap
    #spotify
    /*pkgs.nixpkgs-master.*/bitwarden
    komikku
    #kdePackages.tokodon
    #kdePackages.neochat #broken 21-05
    #whatsapp-for-linux
    stremio

    protonvpn-gui
    #protonmail-bridge
  ];
}
