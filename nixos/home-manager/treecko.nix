{ lib, pkgs, ... } :
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

  wayland.windowManager.hyprland.settings.input = {
    kb_variant = lib.mkForce "thinkpad,nativo";
    numlock_by_default = lib.mkForce false;
  };

  wayland.windowManager.hyprland.settings.monitor = [
    "eDP-1, preferred, auto, 1.5"
    ", preferred, auto, 1"
        ];
}
