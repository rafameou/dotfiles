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
  ];

  /* ... changes to only this sytem */
  /*wayland.windowManager.sway.config.startup = [{command = "--no-startup-id fix";}];*/
  /*wayland.windowManager.sway.config.output = {
    eDP-1 = {
      disable = "";
    };
    HDMI-A-1 = {
      mode = "1920x1080@60.000Hz";
    };
  };
  xsession.windowManager.i3.config.startup = [{command = "--no-startup-id res_fix";}];*/
}
