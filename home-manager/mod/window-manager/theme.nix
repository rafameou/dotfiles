{config, inputs, pkgs, ...}:
let
  #inherit (inputs.nix-colors.lib-contrib {inherit pkgs;}) gtkThemeFromScheme;
  inherit (inputs.nix-colors.lib-contrib {inherit pkgs;}) nixWallpaperFromScheme;

  wallpaper = nixWallpaperFromScheme {
    scheme = config.colorScheme;
    width = 1920;
    height = 1080;
    logoScale = 5.0;
  };
in
  {
    imports = [ ../nix-colors.nix ../qt-theme.nix ../gtk-theme.nix ];
    home.packages = with pkgs; [
      breeze-icons
    ];

    home.pointerCursor = {
      name = "Oxygen_Zion";
      package = pkgs.kdePackages.oxygen;
      /*size = 16;*/
      x11.enable = true;
      gtk.enable = true;
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
        picture-filename = "${wallpaper}"; #"/home/rafameou/GoogleDrive/back";
        picture-options = "zoom";
      };
    };
  }
