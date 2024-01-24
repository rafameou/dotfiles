{configs, config, pkgs, lib, ...}:
{
  home.packages = with pkgs; [
    libsForQt5.qt5ct
    #libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5.qtwayland
    #qt6Packages.qtstyleplugin-kvantum
    qt6.qtwayland
    qt6Packages.qt6ct

    libsForQt5.oxygen
    libsForQt5.oxygen-sounds
    libsForQt5.oxygen-icons5

    gnome.adwaita-icon-theme
    hicolor-icon-theme

    breeze-icons
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

  /*---------------------------------------------------|
  | https://sesh.github.io/base16-viewer/ + qt5ct docs |
  | The default tinted theme for qt5 has weird text    |
  | colors for some reason, so I decided to make my    |
  | own version, kinda lazy to make the disabled and   |
  | inactive variants, sorry.                          |
  |---------------------------------------------------*/
  xdg.configFile."qt-color-base16.conf".text = ''
[ColorScheme]	
active_colors=#ff${config.colorScheme.colors.base05}, #ff${config.colorScheme.colors.base01}, #ff${config.colorScheme.colors.base07}, #ff${config.colorScheme.colors.base06}, #ff${config.colorScheme.colors.base02}, #ff${config.colorScheme.colors.base03}, #ff${config.colorScheme.colors.base05}, #ff${config.colorScheme.colors.base07}, #ff${config.colorScheme.colors.base05}, #ff${config.colorScheme.colors.base00}, #ff${config.colorScheme.colors.base00}, #ff${config.colorScheme.colors.base03}, #ff${config.colorScheme.colors.base02}, #ff${config.colorScheme.colors.base05}, #ff${config.colorScheme.colors.base0D}, #ff${config.colorScheme.colors.base0E}, #ff${config.colorScheme.colors.base02}, #ff${config.colorScheme.colors.base05}, #ff${config.colorScheme.colors.base01}, #ff${config.colorScheme.colors.base05}, #8f${config.colorScheme.colors.base05}
disabled_colors=#ff${config.colorScheme.colors.base05}, #ff${config.colorScheme.colors.base01}, #ff${config.colorScheme.colors.base07}, #ff${config.colorScheme.colors.base06}, #ff${config.colorScheme.colors.base02}, #ff${config.colorScheme.colors.base03}, #ff${config.colorScheme.colors.base05}, #ff${config.colorScheme.colors.base07}, #ff${config.colorScheme.colors.base05}, #ff${config.colorScheme.colors.base00}, #ff${config.colorScheme.colors.base00}, #ff${config.colorScheme.colors.base03}, #ff${config.colorScheme.colors.base02}, #ff${config.colorScheme.colors.base05}, #ff${config.colorScheme.colors.base0D}, #ff${config.colorScheme.colors.base0E}, #ff${config.colorScheme.colors.base02}, #ff${config.colorScheme.colors.base05}, #ff${config.colorScheme.colors.base01}, #ff${config.colorScheme.colors.base05}, #8f${config.colorScheme.colors.base05}
inactive_colors=#ff${config.colorScheme.colors.base05}, #ff${config.colorScheme.colors.base01}, #ff${config.colorScheme.colors.base07}, #ff${config.colorScheme.colors.base06}, #ff${config.colorScheme.colors.base02}, #ff${config.colorScheme.colors.base03}, #ff${config.colorScheme.colors.base05}, #ff${config.colorScheme.colors.base07}, #ff${config.colorScheme.colors.base05}, #ff${config.colorScheme.colors.base00}, #ff${config.colorScheme.colors.base00}, #ff${config.colorScheme.colors.base03}, #ff${config.colorScheme.colors.base02}, #ff${config.colorScheme.colors.base05}, #ff${config.colorScheme.colors.base0D}, #ff${config.colorScheme.colors.base0E}, #ff${config.colorScheme.colors.base02}, #ff${config.colorScheme.colors.base05}, #ff${config.colorScheme.colors.base01}, #ff${config.colorScheme.colors.base05}, #8f${config.colorScheme.colors.base05}
'';

  xdg.configFile."qt5ct/qt5ct.conf".text = ''
[Appearance]
color_scheme_path=~/.config/qt-color-base16.conf
custom_palette=true
icon_theme=oomox-gruvbox-dark
style=Fusion

[Fonts]
fixed="Fira Mono,12,-1,5,50,0,0,0,0,0,Regular"
general="Fira Sans,12,-1,5,50,0,0,0,0,0,Regular"
  '';

  /*------------------------------------|
  | I hope kde team port oxygen to qt6. |
  |------------------------------------*/
  xdg.configFile."qt6ct/qt6ct.conf".text = ''
[Appearance]
color_scheme_path=~/.config/qt-color-base16.conf
custom_palette=true
icon_theme=oomox-gruvbox-dark
style=Fusion

[Fonts]
fixed="Fira Mono,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,Regular"
general="Fira Sans,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,Regular"
  '';

  gtk = {
    enable = true;
    font = {
      name = "Fira Sans";
      size = 12;
    };
    theme = {
      name = "gruvbox-dark";
      package = pkgs.gruvbox-dark-gtk;
    };
    iconTheme = {
      name = "oomox-gruvbox-dark";
      package = pkgs.gruvbox-dark-icons-gtk;
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

  /*home.sessionVariables.GTK_THEME = "Vertex-Dark";*/
}
