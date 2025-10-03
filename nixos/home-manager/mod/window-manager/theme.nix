{
  config,
  inputs,
  pkgs,
  ...
}:
let
  inherit (inputs.nix-colors.lib-contrib { inherit pkgs; }) gtkThemeFromScheme;
in
{
  imports = [ ../nix-colors.nix ];
  home.packages = with pkgs; [
    #kdePackages.breeze-icons
    libsForQt5.qt5ct
    # libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5.qtwayland
    # qt6Packages.qtstyleplugin-kvantum
    kdePackages.qtwayland
    kdePackages.qt6ct

    #kdePackages.oxygen
    #kdePackages.oxygen.qt5
    #kdePackages.oxygen-sounds
    #kdePackages.oxygen-icons
  ];

  xdg.configFile = {
    "qt-color-base16.conf".text = ''
      [ColorScheme]	
      active_colors=#ff${config.colorScheme.palette.base05}, #ff${config.colorScheme.palette.base01}, #ff${config.colorScheme.palette.base07}, #ff${config.colorScheme.palette.base06}, #ff${config.colorScheme.palette.base02}, #ff${config.colorScheme.palette.base03}, #ff${config.colorScheme.palette.base05}, #ff${config.colorScheme.palette.base07}, #ff${config.colorScheme.palette.base05}, #ff${config.colorScheme.palette.base00}, #ff${config.colorScheme.palette.base00}, #ff${config.colorScheme.palette.base03}, #ff${config.colorScheme.palette.base02}, #ff${config.colorScheme.palette.base05}, #ff${config.colorScheme.palette.base0D}, #ff${config.colorScheme.palette.base0E}, #ff${config.colorScheme.palette.base02}, #ff${config.colorScheme.palette.base05}, #ff${config.colorScheme.palette.base01}, #ff${config.colorScheme.palette.base05}, #8f${config.colorScheme.palette.base05}
      disabled_colors=#ff${config.colorScheme.palette.base05}, #ff${config.colorScheme.palette.base01}, #ff${config.colorScheme.palette.base07}, #ff${config.colorScheme.palette.base06}, #ff${config.colorScheme.palette.base02}, #ff${config.colorScheme.palette.base03}, #ff${config.colorScheme.palette.base05}, #ff${config.colorScheme.palette.base07}, #ff${config.colorScheme.palette.base05}, #ff${config.colorScheme.palette.base00}, #ff${config.colorScheme.palette.base00}, #ff${config.colorScheme.palette.base03}, #ff${config.colorScheme.palette.base02}, #ff${config.colorScheme.palette.base05}, #ff${config.colorScheme.palette.base0D}, #ff${config.colorScheme.palette.base0E}, #ff${config.colorScheme.palette.base02}, #ff${config.colorScheme.palette.base05}, #ff${config.colorScheme.palette.base01}, #ff${config.colorScheme.palette.base05}, #8f${config.colorScheme.palette.base05}
      inactive_colors=#ff${config.colorScheme.palette.base05}, #ff${config.colorScheme.palette.base01}, #ff${config.colorScheme.palette.base07}, #ff${config.colorScheme.palette.base06}, #ff${config.colorScheme.palette.base02}, #ff${config.colorScheme.palette.base03}, #ff${config.colorScheme.palette.base05}, #ff${config.colorScheme.palette.base07}, #ff${config.colorScheme.palette.base05}, #ff${config.colorScheme.palette.base00}, #ff${config.colorScheme.palette.base00}, #ff${config.colorScheme.palette.base03}, #ff${config.colorScheme.palette.base02}, #ff${config.colorScheme.palette.base05}, #ff${config.colorScheme.palette.base0D}, #ff${config.colorScheme.palette.base0E}, #ff${config.colorScheme.palette.base02}, #ff${config.colorScheme.palette.base05}, #ff${config.colorScheme.palette.base01}, #ff${config.colorScheme.palette.base05}, #8f${config.colorScheme.palette.base05}
    '';

    "qt5ct/qt5ct.conf".text = ''
      [Appearance]
      color_scheme_path=~/.config/qt-color-base16.conf
      custom_palette=true
      icon_theme=Gruvbox-Plus-Dark
      style=Breeze

      [Fonts]
      fixed="FiraCode Nerd Font Mono,12,-1,5,50,0,0,0,0,0,Regular"
      general="Fira Sans,12,-1,5,50,0,0,0,0,0,Regular"
    '';

    "qt6ct/qt6ct.conf".text = ''
      [Appearance]
      color_scheme_path=~/.config/qt-color-base16.conf
      custom_palette=true
      icon_theme=Gruvbox-Plus-Dark
      style=Breeze

      [Fonts]
      fixed="FiraCode Nerd Font Mono,12,-1,5,50,0,0,0,0,0,Regular"
      general="Fira Sans,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,Regular"
    '';
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
  };

  home.pointerCursor = {
    name = "phinger-cursors-light";
    package = pkgs.phinger-cursors;
    size = 32;
    x11.enable = true;
    gtk.enable = true;
  };

  dconf.settings = {
    /*"org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:";
    };*/
    "org/gtk/settings/file-chooser" = {
      sort-directories-first = true;
    };
    "org/gtk/gtk4/settings/file-chooser" = {
      sort-directories-first = true;
    };
    "org/mate/panel/menubar" = {
      icon-name = "nix-snowflake-white";
      icon-theme = "nix-snowflake-white";
    };
    "org/mate/desktop/background" = {
      #picture-filename = "${wallpaper}"; #"/home/rafameou/GoogleDrive/back";
      picture-options = "zoom";
    };
  };

  gtk = {
    enable = true;
    font = {
      name = "Fira Sans";
      size = 12;
    };
    theme = {
      name = "${config.colorScheme.slug}";
      package = gtkThemeFromScheme {
        scheme = config.colorScheme;
      };
    };
    iconTheme = {
      name = "Gruvbox-Plus-Dark";
      package = pkgs.gruvbox-plus-icons;
    };
    /*cursorTheme = {
      name = "phinger-cursors-light";
      package = pkgs.phinger-cursors;
    };*/

    gtk2.extraConfig = ''
      gtk-enable-animations=1
      gtk-primary-button-warps-slider=0
      gtk-toolbar-style=3
      gtk-menu-images=1
      gtk-button-images=1
    '';

    gtk3 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = true;
        gtk-decoration-layout = "icon:minimize,maximize,close";
        gtk-enable-animations = true;
        gtk-menu-images = true;
        gtk-modules = "colorreload-gtk-module:window-decorations-gtk-module";
        gtk-primary-button-warps-slider = false;
        gtk-toolbar-style = 3;
      };
    };

    gtk4 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = true;
        gtk-decoration-layout = "icon:minimize,maximize,close";
        gtk-enable-animations = true;
        gtk-primary-button-warps-slider = false;
      };
    };
  };
}
