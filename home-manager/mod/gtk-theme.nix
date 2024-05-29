{config, inputs, pkgs, ...}:
  {
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
      };
    };

    /*home.sessionVariables.GTK_THEME = "Vertex-Dark";*/
  }
