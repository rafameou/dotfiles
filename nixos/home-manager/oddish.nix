{ pkgs, ... }:
{
  imports = [
    ./mod/home-manager.nix
    #./mod/xdg.nix
    ./mod/zsh.nix

    #./mod/apps/edit.nix
    #./mod/apps/games.nix
    #./mod/apps/internet.nix
    #./mod/apps/tools.nix
    #./mod/apps/separated/retroarch.nix
    #./mod/apps/separated/rclone-server.nix

    # - sway -
    #./mod/window-manager.nix
    # - other desktops -
    ./mod/desktop-environment.nix
    #./mod/desktop-environment/gnome.nix
    #./mod/desktop-environment/kde.nix
    #./mod/desktop-environment/mate.nix
    #./mod/desktop-environment/xfce.nix

    ./mod/apps/separated/neovim.nix
  ];

  programs = {
    firefox = {
      enable = true;
    };
  };

  home.packages = with pkgs; [

    gh

    unar
    unzip
    zip
    freerdp
    htop
    lm_sensors
    powerstat
    nixos-icons
  ];

  # ... changes to only this sytem
}
