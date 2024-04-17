{config, inputs, pkgs, ...}:
let
  inherit (inputs.nix-colors.lib-contrib {inherit pkgs;}) gtkThemeFromScheme;
in
  {
    imports = [ ./nix-colors.nix ];
    home.packages = with pkgs; [
      mate.mate-icon-theme-faenza
      gruvbox-dark-icons-gtk
      gnome.adwaita-icon-theme
      hicolor-icon-theme

      breeze-icons
    ];

    gtk = {
      enable = true;
      font = {
        name = "Fira Sans";
        size = 11;
      };
      theme = {
        /*name = "Gruvbox-Dark-BL-LB";
        package = pkgs.gruvbox-gtk-theme;*/
        name = "${config.colorScheme.slug}";
        package = gtkThemeFromScheme {
          scheme = config.colorScheme;
        };
      };
      iconTheme = {
        /*name = "oomox-gruvbox-dark";
        package = pkgs.gruvbox-dark-icons-gtk;*/
        name = "Gruvbox-Plus-Dark";
        package = pkgs.gruvbox-plus-icons;
        /*name = "matefaenzadark";*/
      };
      /*cursorTheme = {
        name = "Oxygen_Zion";
        package = pkgs.kdePackages.oxygen;
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
