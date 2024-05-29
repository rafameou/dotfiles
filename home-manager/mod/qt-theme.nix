{config, inputs, pkgs, ...}:
  {
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
      #platformTheme.name = "qtct";
    };
  }
