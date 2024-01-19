{ inputs, lib, config, pkgs, ... }:
{
  home.packages = with pkgs; [
    gnome.gnome-software
    gnome.dconf-editor
    gnome.file-roller

    galculator
    libsForQt5.okular
    
    networkmanagerapplet

    arc-theme
    arc-icon-theme
    cinnamon.mint-themes
    cinnamon.mint-x-icons
    zuki-themes
    greybird
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
