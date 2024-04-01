{config, inputs, pkgs, ...}:
let
  inherit (inputs.nix-colors.lib-contrib {inherit pkgs;}) gtkThemeFromScheme;
  /*inherit (inputs.nix-colors.lib-contrib {inherit pkgs;}) nixWallpaperFromScheme;

  wallpaper = nixWallpaperFromScheme {
    scheme = config.colorScheme;
    width = 1920;
    height = 1080;
    logoScale = 5.0;
  };*/
in
  {
    imports = [ ../nix-colors.nix ];
    home.packages = with pkgs; [
      libsForQt5.qt5ct
    #libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5.qtwayland
    #qt6Packages.qtstyleplugin-kvantum
    kdePackages.qtwayland
    kdePackages.qt6ct

    kdePackages.oxygen
    kdePackages.oxygen.qt5
    kdePackages.oxygen-sounds
    kdePackages.oxygen-icons

    kdePackages.breeze
    kde-gruvbox

    mate.mate-icon-theme-faenza
    gruvbox-dark-icons-gtk
    gnome.adwaita-icon-theme
    hicolor-icon-theme

    breeze-icons
  ];

  home.pointerCursor = {
    name = "Oxygen_Zion";
    package = pkgs.kdePackages.oxygen;
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
      fixed="FiraCode Nerd Font Mono,10,-1,5,50,0,0,0,0,0,Regular"
      general="Fira Sans,10,-1,5,50,0,0,0,0,0,Regular"
    '';

    "qt6ct/qt6ct.conf".text = ''
      [Appearance]
      color_scheme_path=~/.config/qt-color-base16.conf
      custom_palette=true
      icon_theme=Gruvbox-Plus-Dark
      style=Oxygen

      [Fonts]
      fixed="FiraCode Nerd Font Mono,10,-1,5,50,0,0,0,0,0,Regular"
      general="Fira Sans,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,Regular"
    '';

    /* create vimiv.nix */
    "vimiv/styles/nix-colors".text = ''
      ; base16-{{scheme-slug}}
      ;
      ; base16: (https://github.com/chriskempson/base16)
      ;
      ; Scheme: {{scheme-author}}
      ; Template: Christian Karl <karlch at protonmail dot com>

      [STYLE]
      ; Colors
      base00 = #${config.colorScheme.palette.base00}
      base01 = #${config.colorScheme.palette.base01}
      base02 = #${config.colorScheme.palette.base02}
      base03 = #${config.colorScheme.palette.base03}
      base04 = #${config.colorScheme.palette.base04}
      base05 = #${config.colorScheme.palette.base05}
      base06 = #${config.colorScheme.palette.base06}
      base07 = #${config.colorScheme.palette.base07}
      base08 = #${config.colorScheme.palette.base08}
      base09 = #${config.colorScheme.palette.base09}
      base0a = #${config.colorScheme.palette.base0A}
      base0b = #${config.colorScheme.palette.base0B}
      base0c = #${config.colorScheme.palette.base0C}
      base0d = #${config.colorScheme.palette.base0D}
      base0e = #${config.colorScheme.palette.base0E}
      base0f = #${config.colorScheme.palette.base0F}

      ; Additional custom overrides, e.g.
      font = 10pt Fira Sans
      ; thumbnail.padding = 32

      ; vim:ft=dosini
    '';

    "vimiv/vimiv.conf".text = ''
      [GENERAL]
      style = nix-colors
    '';
  };

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
      size = 10;
    };
    theme = {
      #name = "Gruvbox-Dark-BL-LB";
      #package = pkgs.gruvbox-gtk-theme;
      name = "${config.colorScheme.slug}";
      package = gtkThemeFromScheme {
        scheme = config.colorScheme;
      };
    };
    iconTheme = {
      #name = "oomox-gruvbox-dark";
      #package = pkgs.gruvbox-dark-icons-gtk;
      name = "Gruvbox-Plus-Dark";
      package = pkgs.gruvbox-plus-icons;
      #name = "matefaenzadark";
    };
    cursorTheme = {
      name = "Oxygen_Zion";
      package = pkgs.kdePackages.oxygen;
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
      /*copy gtk4's gruvbox theme*/
      /*extraCss = ''
      @define-color accent_color #${config.colorScheme.palette.base0D};
      @define-color accent_bg_color mix(#${config.colorScheme.palette.base0D}, #${config.colorScheme.palette.base00},0.3);
      @define-color accent_fg_color #${config.colorScheme.palette.base05};
      @define-color destructive_color #${config.colorScheme.palette.base0D};
      @define-color destructive_bg_color mix(#${config.colorScheme.palette.base0D}, #${config.colorScheme.palette.base00},0.3);
      @define-color destructive_fg_color #${config.colorScheme.palette.base05};
      @define-color success_color #${config.colorScheme.palette.base0B};
      @define-color success_bg_color mix(#${config.colorScheme.palette.base0D}, #${config.colorScheme.palette.base00},0.3);
      @define-color success_fg_color #${config.colorScheme.palette.base05};
      @define-color warning_color #${config.colorScheme.palette.base0A};
      @define-color warning_bg_color mix(#${config.colorScheme.palette.base0D}, #${config.colorScheme.palette.base00},0.3);
      @define-color warning_fg_color rgba(0, 0, 0, 0.8);
      @define-color error_color #${config.colorScheme.palette.base08};
      @define-color error_bg_color mix(#${config.colorScheme.palette.base0D}, #${config.colorScheme.palette.base00},0.3);
      @define-color error_fg_color #${config.colorScheme.palette.base05};
      @define-color window_bg_color #${config.colorScheme.palette.base00};
      @define-color window_fg_color #${config.colorScheme.palette.base05};
      @define-color view_bg_color #${config.colorScheme.palette.base01};
      @define-color view_fg_color #${config.colorScheme.palette.base05};
      @define-color headerbar_bg_color mix(#${config.colorScheme.palette.base00},black,0.2);
      @define-color headerbar_fg_color #${config.colorScheme.palette.base05};
      @define-color headerbar_border_color #${config.colorScheme.palette.base05};
      @define-color headerbar_backdrop_color @window_bg_color;
      @define-color headerbar_shade_color rgba(0, 0, 0, 0.36);
      @define-color card_bg_color rgba(255, 255, 255, 0.08);
      @define-color card_fg_color #${config.colorScheme.palette.base05};
      @define-color card_shade_color rgba(0, 0, 0, 0.36);
      @define-color dialog_bg_color #${config.colorScheme.palette.base03};
      @define-color dialog_fg_color #${config.colorScheme.palette.base05};
      @define-color popover_bg_color #${config.colorScheme.palette.base03};
      @define-color popover_fg_color #${config.colorScheme.palette.base05};
      @define-color shade_color rgba(0,0,0,0.36);
      @define-color scrollbar_outline_color rgba(0,0,0,0.5);
      @define-color blue_1 #${config.colorScheme.palette.base0D};
      @define-color blue_2 #${config.colorScheme.palette.base0D};
      @define-color blue_3 #${config.colorScheme.palette.base0D};
      @define-color blue_4 #${config.colorScheme.palette.base0D};
      @define-color blue_5 #${config.colorScheme.palette.base0D};
      @define-color green_1 #${config.colorScheme.palette.base0B};
      @define-color green_2 #${config.colorScheme.palette.base0B};
      @define-color green_3 #${config.colorScheme.palette.base0B};
      @define-color green_4 #${config.colorScheme.palette.base0B};
      @define-color green_5 #${config.colorScheme.palette.base0B};
      @define-color yellow_1 #${config.colorScheme.palette.base0A};
      @define-color yellow_2 #${config.colorScheme.palette.base0A};
      @define-color yellow_3 #${config.colorScheme.palette.base0A};
      @define-color yellow_4 #${config.colorScheme.palette.base0A};
      @define-color yellow_5 #${config.colorScheme.palette.base0A};
      @define-color orange_1 #${config.colorScheme.palette.base09};
      @define-color orange_2 #${config.colorScheme.palette.base09};
      @define-color orange_3 #${config.colorScheme.palette.base09};
      @define-color orange_4 #${config.colorScheme.palette.base09};
      @define-color orange_5 #${config.colorScheme.palette.base09};
      @define-color red_1 #${config.colorScheme.palette.base08};
      @define-color red_2 #${config.colorScheme.palette.base08};
      @define-color red_3 #${config.colorScheme.palette.base08};
      @define-color red_4 #${config.colorScheme.palette.base08};
      @define-color red_5 #${config.colorScheme.palette.base08};
      @define-color purple_1 #${config.colorScheme.palette.base0E};
      @define-color purple_2 #${config.colorScheme.palette.base0E};
      @define-color purple_3 #${config.colorScheme.palette.base0E};
      @define-color purple_4 #${config.colorScheme.palette.base0E};
      @define-color purple_5 #${config.colorScheme.palette.base0E};
      @define-color brown_1 #${config.colorScheme.palette.base0F};
      @define-color brown_2 #${config.colorScheme.palette.base0F};
      @define-color brown_3 #${config.colorScheme.palette.base0F};
      @define-color brown_4 #${config.colorScheme.palette.base0F};
      @define-color brown_5 #${config.colorScheme.palette.base0F};
      @define-color light_1 #${config.colorScheme.palette.base05};
      @define-color light_2 #${config.colorScheme.palette.base05};
      @define-color light_3 #${config.colorScheme.palette.base05};
      @define-color light_4 #${config.colorScheme.palette.base05};
      @define-color light_5 #${config.colorScheme.palette.base05};
      @define-color dark_1 mix(#${config.colorScheme.palette.base00},white,0.5);
      @define-color dark_2 mix(#${config.colorScheme.palette.base00},white,0.2);
      @define-color dark_3 #${config.colorScheme.palette.base00};
      @define-color dark_4 mix(#${config.colorScheme.palette.base00},black,0.2);
      @define-color dark_5 mix(#${config.colorScheme.palette.base00},black,0.4);
      '';*/
    };
  };

  /*home.sessionVariables.GTK_THEME = "Vertex-Dark";*/
}
