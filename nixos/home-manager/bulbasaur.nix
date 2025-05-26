{ pkgs, ... }:
{
  imports = [
    ./mod/home-manager.nix
    ./mod/nix-colors.nix
    ./mod/xdg-lxqt.nix
    ./mod/zsh.nix

    ./mod/apps/edit.nix
    ./mod/apps/games.nix
    ./mod/apps/internet.nix
    ./mod/apps/tools.nix
    #./mod/apps/separated/retroarch.nix
    #./mod/apps/separated/rclone-server.nix

    # - sway -
    ./mod/window-manager.nix
    # - other desktops -
    # ./mod/desktop-environment.nix
    #./mod/desktop-environment/gnome.nix
    # ./mod/desktop-environment/kde.nix
    #./mod/desktop-environment/mate.nix
    #./mod/desktop-environment/xfce.nix
    ./mod/desktop-environment/lxqt.nix
  ];

  # ... changes to only this sytem
  #nixpkgs.overlays = [(final: prev: { hyprland = prev.hyprland.override { legacyRenderer = true; };})];
}
