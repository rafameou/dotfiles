{ pkgs, ... } :
{
  imports = [
    ./mod/home-manager.nix
    ./mod/xdg.nix
    ./mod/zsh.nix

    ./mod/apps.nix
    #./mod/apps-minimal.nix
    #./mod/apps-server.nix

    /* - sway - */
    #./mod/window-manager.nix
    /* - other desktops - */
    ./mod/desktop-environment.nix
    ./mod/desktop-environment/gnome.nix
    #./mod/desktop-environment/kde.nix
    #./mod/desktop-environment/mate.nix
    #./mod/desktop-environment/xfce.nix

    ./mod/apps/rclone-server.nix
  ];

  /* ... changes to only this sytem */
  home.packages = with pkgs; [
    screen
    firejail
    nodejs_22 figlet cowsay
  ];


}
