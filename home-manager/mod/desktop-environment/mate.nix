{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gnome.gnome-software
    gnome.dconf-editor
    mate.mate-tweak
    mate.mate-icon-theme-faenza
    networkmanagerapplet

    arc-theme
    arc-icon-theme
    cinnamon.mint-themes
    mate.mate-icon-theme-faenza
    cinnamon.mint-x-icons
    gruvbox-dark-gtk

    kdePackages.oxygen
    kdePackages.oxygen.qt5 
    kdePackages.oxygen-sounds
    kdePackages.oxygen-icons

    /* -- for neovim --*/
    wl-clipboard

    libsForQt5.qt5ct
    kdePackages.qt6ct
    kdePackages.qtwayland
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
