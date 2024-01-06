{configs, pkgs, lib, ...}:
{
  home.packages = with pkgs; [
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5.qtwayland
    qt6Packages.qtstyleplugin-kvantum
    qt6.qtwayland
    qt6Packages.qt6ct

    libsForQt5.oxygen
    libsForQt5.oxygen-sounds
    libsForQt5.oxygen-icons5

    gnome.adwaita-icon-theme
    hicolor-icon-theme

    breeze-icons

    /*(catppuccin-kvantum.override {
    accent = "Sky";
    variant = "Frappe";
    })*/
    (catppuccin.override {
      accent = "green";
      variant = "frappe";
      themeList = ["kvantum"];
    })
  ];

  home.pointerCursor = {
    name = "phinger-cursors";
    package = pkgs.phinger-cursors;
    /*size = 16;*/
    x11.enable = true;
    gtk.enable = true;
  };

  qt = {
    enable = true;
    platformTheme = "qtct";
  };

  gtk = {
    enable = true;
    font = {
      name = "Spleen 32x64";
      size = 12;
    };
    theme = {
      /*name = "Vertex-Dark";
      package = pkgs.theme-vertex;*/
      name = "Catppuccin-Frappe-Compact-Green-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "green" ];
        size = "compact";
        tweaks = [ "rimless" ];
        variant = "frappe";
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        accent = "green";
        flavor = "frappe";
      };
    };
    cursorTheme = {
      name = "phinger-cursors";
      package = pkgs.phinger-cursors;
    };

    gtk2.extraConfig = ''
      gtk-enable-animations=1
      gtk-primary-button-warps-slider=0
      gtk-toolbar-style=3
      gtk-menu-images=1
      gtk-button-images=1
    '';

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-decoration-layout = "icon:minimize,maximize,close";
      gtk-enable-animations = true;
      gtk-menu-images = true;
      gtk-modules = "colorreload-gtk-module:window-decorations-gtk-module";
      gtk-primary-button-warps-slider = false;
      gtk-toolbar-style = 3;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-decoration-layout = "icon:minimize,maximize,close";
      gtk-enable-animations = true;
      gtk-primary-button-warps-slider = false;
    };
  };

  /*home.sessionVariables.GTK_THEME = "Vertex-Dark";*/
}
