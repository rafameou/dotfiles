{ lib, pkgs, ... }:
{
  imports = [
    ./mod/home-manager.nix
    ./mod/nix-colors.nix
    ./mod/xdg-gnome.nix
    ./mod/zsh.nix

    ./mod/apps/edit.nix
    ./mod/apps/games.nix
    ./mod/apps/internet.nix
    ./mod/apps/tools.nix
    #./mod/apps/separated/retroarch.nix
    #./mod/apps/separated/rclone-server.nix

    # - sway -
    # ./mod/window-manager.nix
    # - other desktops -
    ./mod/desktop-environment.nix
    ./mod/desktop-environment/gnome.nix
    #./mod/desktop-environment/kde.nix
    #./mod/desktop-environment/mate.nix
    #./mod/desktop-environment/xfce.nix
    #./mod/desktop-environment/lxqt.nix
  ];

  # ... changes to only this sytem
  /*
    wayland.windowManager.sway.config = {
      input."type:keyboard" = {
        xkb_variant = lib.mkForce "thinkpad,nativo";
        xkb_numlock = lib.mkForce "disabled,disabled";
      };
      output = {
        eDP-1 = {
          scale = "1.5";
        };
      };
    };

    programs.niri.settings = {
      input.keyboard.xkb = {
          variant = "thinkpad";
      };
      outputs."eDP-1".scale = 1.0;
    };

    wayland.windowManager.hyprland.settings.input = {
      kb_variant = lib.mkForce "thinkpad,nativo";
      numlock_by_default = lib.mkForce false;
    };

    wayland.windowManager.hyprland.settings.monitor = [
      "eDP-1, preferred, auto, 1.5"
      ", preferred, auto, 1"
    ];

    programs.waybar.settings.bottomBar = {
      cpu.format = lib.mkForce "{icon0}{icon1}{icon2}{icon3}{icon4}{icon5}{icon6}{icon7}{usage}%";
      temperature.hmon-path = lib.mkForce "/sys/devices/platform/thinkpad_hwmon/hwmon/hwmon6/temp1_input";
    };
  */
}
