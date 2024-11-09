{ pkgs, ... }:
{
  imports = [
    #./separated/retroarch.nix
  ];
  home.packages = with pkgs; [
    easyrpg-player
    crispy-doom
    dsda-doom
    dsda-launcher
    prismlauncher
    runelite 
    #steam #fix steam games: SDL_VIDEODRIVER=x11 prime-run %command% -vulkan
    #itch #marked as broken 24/03/24
    heroic
    protonup-qt
    (pkgs.unityhub.override {
      extraLibs = pkgs: with pkgs; [
        openssl_1_1
        openssl_legacy
      ];
    })
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];
}
