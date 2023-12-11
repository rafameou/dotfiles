{ inputs, lib, config, pkgs, ... }:
{
  programs.firefox.enable = true;
  home.packages = with pkgs; [
    #vivaldi
    qutebrowser
    google-chrome
    thunderbird
    tdesktop
    #(discord.override { nss = nss_latest; })
    webcord
    spotify
    inputs.nixpkgs-master.legacyPackages.${system}.bitwarden
    komikku
  ];
}
