{ inputs, lib, config, pkgs, ... }:
{
  #fix steam games: SDL_VIDEODRIVER=x11 prime-run %command% -vulkan
  home.packages = with pkgs; [
    easyrpg-player
    crispy-doom
    prboom-plus
    prismlauncher
    runelite
    steam
  ];
}
