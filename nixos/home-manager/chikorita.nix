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
    #./mod/desktop-environment.nix
    #./mod/desktop-environment/gnome.nix
    #./mod/desktop-environment/kde.nix
    #./mod/desktop-environment/mate.nix
    #./mod/desktop-environment/xfce.nix
    ./mod/desktop-environment/lxqt.nix
  ];

  # ... changes to only this sytem
  # wayland.windowManager.sway.config.startup = [{command = "--no-startup-id fix";}];
  wayland.windowManager.sway = {
    extraOptions = [
      "--unsupported-gpu"
    ];
    config.output = {
      eDP-1 = {
        disable = "";
      };
      HDMI-A-1 = {
        mode = "1920x1080@60.000Hz";
        scale = "1.0";
      };
    };
  };

  wayland.windowManager.hyprland.settings.monitor = [
    "HDMI-A-1, 1920x1080@60, 0x0, 1.25"
    "eDP-1, disable"
  ];

  programs.niri.settings = {
    outputs = {
      "eDP-1".enable = false;
      "HDMI-A-1".mode = {
        width = 1920;
        height = 1080;
        refresh = 60.0;
      };
    };
  };

  xdg.configFile = {
    "wayfire.ini".text = ''
      [output:eDP-1]
      mode = off
      [output:HDMI-A-1]
      mode = 1920x1080@60000
      position = 0,0
      transform = normal
      scale = 1.000000
    '';
  };
  #xsession.windowManager.i3.config.startup = [{command = "--no-startup-id res_fix";}];
}
