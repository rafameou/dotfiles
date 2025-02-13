{ pkgs, ... }:
{
  home.packages = with pkgs; [
    arc-theme
    arc-icon-theme
    cinnamon.mint-themes
    cinnamon.mint-x-icons
    zuki-themes
    greybird
  ];

  services.gammastep.enable = true;
  #services.redshift.provider = "geoclue2";

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
