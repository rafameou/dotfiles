{ pkgs, ... }:
{
  imports = [
    #./separated/retroarch.nix
  ];
  home.packages = with pkgs; [
    #easyrpg-player #broken 02/03/25
    crispy-doom
    dsda-doom
    dsda-launcher
    prismlauncher
    runelite
    #steam #fix steam games: SDL_VIDEODRIVER=x11 prime-run %command% -vulkan
    #itch #marked as broken 24/03/24
    heroic
    protonup-qt
  ];
}
