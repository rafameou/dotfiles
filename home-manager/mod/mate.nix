{ inputs, lib, config, pkgs, ... }:
{
  home.packages = with pkgs; [
    gnome.gnome-software
    gnome.dconf-editorb
    mate.mate-tweak
    mate.mate-icon-theme-faenza
  ];

  qt = {
    enable = true;
    #platformTheme = "gnome";
    #style.name = "adwaita";
  };

  /*dconf.settings = {
    "org/mate/panel/menubar" = {
      icon-theme = "start-here";
    };
    "org/mate/desktop/interface" = {
      gtk-theme = "TraditionalOk";
      icon-theme = "mate";
    };
    "org/mate/marco/general" = {
      theme = "Spidey";
    };
  };*/s
}
