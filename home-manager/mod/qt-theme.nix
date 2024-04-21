{config, inputs, pkgs, ...}:
  {
    imports = [ ./nix-colors.nix ];
    home.packages = with pkgs; [
      libsForQt5.qt5ct
      /*libsForQt5.qtstyleplugin-kvantum*/
      libsForQt5.qt5.qtwayland
      /*qt6Packages.qtstyleplugin-kvantum*/
      kdePackages.qtwayland
      kdePackages.qt6ct

      kdePackages.oxygen
      kdePackages.oxygen.qt5
      kdePackages.oxygen-sounds
      kdePackages.oxygen-icons

      kdePackages.breeze
      kde-gruvbox
    ];

    qt = {
      enable = true;
      platformTheme.name = "qtct";
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
        icon_theme=Adwaita
        style=Breeze

        [Fonts]
        fixed="FiraCode Nerd Font Mono,11,-1,5,50,0,0,0,0,0,Regular"
        general="Fira Sans,11,-1,5,50,0,0,0,0,0,Regular"
      '';

      "qt6ct/qt6ct.conf".text = ''
        [Appearance]
        color_scheme_path=~/.config/qt-color-base16.conf
        custom_palette=true
        icon_theme=Adwaita
        style=Oxygen

        [Fonts]
        fixed="FiraCode Nerd Font Mono,11,-1,5,50,0,0,0,0,0,Regular"
        general="Fira Sans,11,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,Regular"
      '';
    };
  }
