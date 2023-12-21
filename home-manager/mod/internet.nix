{ inputs, lib, config, pkgs, ... }:
{
  programs.firefox.enable = true;
  home.packages = with pkgs; [
    #vivaldi
    google-chrome
    thunderbird
    tdesktop
    #(discord.override { nss = nss_latest; })
    webcord
    spotify
    pkgs.nixpkgs-master.bitwarden
    komikku
  ];
}
