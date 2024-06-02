{ pkgs, ... }:
{
  home.packages = with pkgs; [
    mate.mate-tweak
    mate.mate-icon-theme-faenza
    networkmanagerapplet

    #arc-theme
    #arc-icon-theme
    #cinnamon.mint-themes
    mate.mate-icon-theme-faenza
    cinnamon.mint-x-icons
  ];

  dconf.settings = {
    "org/mate/panel/menubar" = {
      icon-theme = "nix-snowflake";
    };
    "org/mate/panel/objects/clock/prefs" = {
      show-seconds = true;
    };
    #"org/mate/desktop/interface" = {
    #  gtk-theme = "TraditionalOk";
    #  icon-theme = "mate";
    #};
    #"org/mate/marco/general" = {
    #  theme = "Spidey";
    #};
  };
}
