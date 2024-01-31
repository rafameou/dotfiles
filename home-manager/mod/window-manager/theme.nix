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

    libsForQt5.breeze-qt5
    kde-gruvbox

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


  dconf.settings = {
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:";
    };
    "org/gtk/settings/file-chooser" = {
      sort-directories-first = true;
    };
    "org/gtk/gtk4/settings/file-chooser" = {
      sort-directories-first = true;
    };
  }; 

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
      extraCss = ''
@define-color accent_color #${config.colorScheme.colors.base0D};
@define-color accent_bg_color mix(#${config.colorScheme.colors.base0D}, #${config.colorScheme.colors.base00},0.3);
@define-color accent_fg_color #${config.colorScheme.colors.base05};
@define-color destructive_color #${config.colorScheme.colors.base0D};
@define-color destructive_bg_color mix(#${config.colorScheme.colors.base0D}, #${config.colorScheme.colors.base00},0.3);
@define-color destructive_fg_color #${config.colorScheme.colors.base05};
@define-color success_color #${config.colorScheme.colors.base0B};
@define-color success_bg_color mix(#${config.colorScheme.colors.base0D}, #${config.colorScheme.colors.base00},0.3);
@define-color success_fg_color #${config.colorScheme.colors.base05};
@define-color warning_color #${config.colorScheme.colors.base0A};
@define-color warning_bg_color mix(#${config.colorScheme.colors.base0D}, #${config.colorScheme.colors.base00},0.3);
@define-color warning_fg_color rgba(0, 0, 0, 0.8);
@define-color error_color #${config.colorScheme.colors.base08};
@define-color error_bg_color mix(#${config.colorScheme.colors.base0D}, #${config.colorScheme.colors.base00},0.3);
@define-color error_fg_color #${config.colorScheme.colors.base05};
@define-color window_bg_color #${config.colorScheme.colors.base00};
@define-color window_fg_color #${config.colorScheme.colors.base05};
@define-color view_bg_color #${config.colorScheme.colors.base01};
@define-color view_fg_color #${config.colorScheme.colors.base05};
@define-color headerbar_bg_color mix(#${config.colorScheme.colors.base00},black,0.2);
@define-color headerbar_fg_color #${config.colorScheme.colors.base05};
@define-color headerbar_border_color #${config.colorScheme.colors.base05};
@define-color headerbar_backdrop_color @window_bg_color;
@define-color headerbar_shade_color rgba(0, 0, 0, 0.36);
@define-color card_bg_color rgba(255, 255, 255, 0.08);
@define-color card_fg_color #${config.colorScheme.colors.base05};
@define-color card_shade_color rgba(0, 0, 0, 0.36);
@define-color dialog_bg_color #${config.colorScheme.colors.base03};
@define-color dialog_fg_color #${config.colorScheme.colors.base05};
@define-color popover_bg_color #${config.colorScheme.colors.base03};
@define-color popover_fg_color #${config.colorScheme.colors.base05};
@define-color shade_color rgba(0,0,0,0.36);
@define-color scrollbar_outline_color rgba(0,0,0,0.5);
@define-color blue_1 #${config.colorScheme.colors.base0D};
@define-color blue_2 #${config.colorScheme.colors.base0D};
@define-color blue_3 #${config.colorScheme.colors.base0D};
@define-color blue_4 #${config.colorScheme.colors.base0D};
@define-color blue_5 #${config.colorScheme.colors.base0D};
@define-color green_1 #${config.colorScheme.colors.base0B};
@define-color green_2 #${config.colorScheme.colors.base0B};
@define-color green_3 #${config.colorScheme.colors.base0B};
@define-color green_4 #${config.colorScheme.colors.base0B};
@define-color green_5 #${config.colorScheme.colors.base0B};
@define-color yellow_1 #${config.colorScheme.colors.base0A};
@define-color yellow_2 #${config.colorScheme.colors.base0A};
@define-color yellow_3 #${config.colorScheme.colors.base0A};
@define-color yellow_4 #${config.colorScheme.colors.base0A};
@define-color yellow_5 #${config.colorScheme.colors.base0A};
@define-color orange_1 #${config.colorScheme.colors.base09};
@define-color orange_2 #${config.colorScheme.colors.base09};
@define-color orange_3 #${config.colorScheme.colors.base09};
@define-color orange_4 #${config.colorScheme.colors.base09};
@define-color orange_5 #${config.colorScheme.colors.base09};
@define-color red_1 #${config.colorScheme.colors.base08};
@define-color red_2 #${config.colorScheme.colors.base08};
@define-color red_3 #${config.colorScheme.colors.base08};
@define-color red_4 #${config.colorScheme.colors.base08};
@define-color red_5 #${config.colorScheme.colors.base08};
@define-color purple_1 #${config.colorScheme.colors.base0E};
@define-color purple_2 #${config.colorScheme.colors.base0E};
@define-color purple_3 #${config.colorScheme.colors.base0E};
@define-color purple_4 #${config.colorScheme.colors.base0E};
@define-color purple_5 #${config.colorScheme.colors.base0E};
@define-color brown_1 #${config.colorScheme.colors.base0F};
@define-color brown_2 #${config.colorScheme.colors.base0F};
@define-color brown_3 #${config.colorScheme.colors.base0F};
@define-color brown_4 #${config.colorScheme.colors.base0F};
@define-color brown_5 #${config.colorScheme.colors.base0F};
@define-color light_1 #${config.colorScheme.colors.base05};
@define-color light_2 #${config.colorScheme.colors.base05};
@define-color light_3 #${config.colorScheme.colors.base05};
@define-color light_4 #${config.colorScheme.colors.base05};
@define-color light_5 #${config.colorScheme.colors.base05};
@define-color dark_1 mix(#${config.colorScheme.colors.base00},white,0.5);
@define-color dark_2 mix(#${config.colorScheme.colors.base00},white,0.2);
@define-color dark_3 #${config.colorScheme.colors.base00};
@define-color dark_4 mix(#${config.colorScheme.colors.base00},black,0.2);
@define-color dark_5 mix(#${config.colorScheme.colors.base00},black,0.4);
      '';
    };
  };

  /*home.sessionVariables.GTK_THEME = "Vertex-Dark";*/
}
