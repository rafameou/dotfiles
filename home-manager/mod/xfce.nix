{ inputs, lib, config, pkgs, ... }:
{
  home.packages = with pkgs; [
    gnome.gnome-software
    gnome.dconf-editor
    
    networkmanagerapplet

    xfce.xfce4-eyes-plugin
    xfce.xfce4-pulseaudio-plugin
    xfce.xfce4-notes-plugin

    arc-theme
    arc-icon-theme
    cinnamon.mint-themes
    #mate.mate-icon-theme-faenza
    #theme-jade1
    #iconpack-jade
    cinnamon.mint-x-icons
  ];

  services.redshift.enable = true;
  services.redshift.provider = "geoclue2";

  qt = {
    enable = true;
    #platformTheme = "gnome";
    #style.name = "adwaita";
  };

  dconf.settings = {
    #"org/mate/panel/menubar" = {
    #  icon-theme = "nix-snowflake";
    #};
    #"org/mate/panel/objects/clock/prefs" = {
    #  show-seconds = true;
    #};
    #"org/mate/desktop/interface" = {
    #  gtk-theme = "TraditionalOk";
    #  icon-theme = "mate";
    #};
    #"org/mate/marco/general" = {
    #  theme = "Spidey";
    #};
  };
}
