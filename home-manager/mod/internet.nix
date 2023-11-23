{ inputs, lib, config, pkgs, ... }:
{
  home.packages = with pkgs; [
    vivaldi
    google-chrome
    thunderbird
    tdesktop
    #(discord.override { nss = nss_latest; })
    webcord
    spotify
    bitwarden
    komikku
  ];
}
