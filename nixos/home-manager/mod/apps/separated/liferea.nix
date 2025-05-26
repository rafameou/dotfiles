{ pkgs, ... }:
{
  home.packages = with pkgs; [
    liferea
  ];

  dconf.settings = {
    "org/gnome/liferea/plugins".active-plugins = [
      # "libnotify"
      "plugin-installer"
      "trayicon"
    ];
  };
}
