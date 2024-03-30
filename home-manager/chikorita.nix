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
    ./mod/window-manager.nix
    /* - other desktops - */
    ./mod/desktop-environment.nix
    #./mod/desktop-environment/gnome.nix
    #./mod/desktop-environment/kde.nix
    #./mod/desktop-environment/mate.nix
    #./mod/desktop-environment/xfce.nix
  ];

  /* ... changes to only this sytem */
  wayland.windowManager.sway.config.startup = [{command = "--no-startup-id fix";}];
  xsession.windowManager.i3.config.startup = [{command = "--no-startup-id fix";}];

  home.packages = with pkgs; [
    ciscoPacketTracer8
    wireshark
  ];
}
