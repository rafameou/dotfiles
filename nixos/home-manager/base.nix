{ ... }:
{
  imports = [
    ./mod/home-manager.nix
    ./mod/nix-colors.nix
    #./mod/xdg.nix
    #./mod/zsh.nix

    #./mod/apps/edit.nix
    #./mod/apps/games.nix
    #./mod/apps/internet.nix
    #./mod/apps/tools.nix
    #./mod/apps/separated/retroarch.nix
    #./mod/apps/separated/rclone-server.nix

    # - sway -
    #./mod/window-manager.nix
    # - other desktops -
    #./mod/desktop-environment.nix
    #./mod/desktop-environment/gnome.nix
    #./mod/desktop-environment/kde.nix
    #./mod/desktop-environment/mate.nix
    #./mod/desktop-environment/xfce.nix
  ];

  # ... changes to only this sytem
}
