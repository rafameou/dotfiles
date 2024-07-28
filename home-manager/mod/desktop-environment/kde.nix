{ inputs, pkgs, ... }:
{
  imports = [
    inputs.plasma-manager.homeManagerModules.plasma-manager
  ];

  /*qt = {
  enable = true;
  platformTheme.name = "kde";
  };*/

  home.packages = with pkgs; [
    dconf-editor

    kde-gruvbox
    gruvbox-dark-gtk

    /* -- for neovim --*/
    wl-clipboard

    /* -- apps --*/
    kdePackages.kpat
    kdePackages.kmines

    kdePackages.kcalc
    kdePackages.kalk
    kdePackages.discover
    kdePackages.kdeconnect-kde

    kaffeine
  ];

  programs.plasma = {
    enable = true;
    workspace = {
      theme = "oxygen";
      colorScheme = "Oxygen"; #"Gruvbox";
      iconTheme = "oxygen";
      cursor.theme = "Oxygen_Zion";
      lookAndFeel = "org.kde.oxygen";
      soundTheme = "Oxygen";
    };
    startup = {
      startupScript = {
        trayscale.text = "trayscale --hide-window";
      };
    };
    panels = 
    [ 
      {
        location = "bottom";
        floating = true;
        height = 48;
        widgets = 
        [
          {
            name = "org.kde.plasma.kickoff";
            config.General = {
              icon = "nix-snowflake-white";
              showRecentDocs = "false";
              useCustomButtonImage = "true";
            };
          }
          {
            name = "org.kde.plasma.pager";
            config.General = {
              showWindowIcons = "true";
            };
          }
          {
            name = "org.kde.plasma.taskmanager";
            config.General = {
              launchers = "";
              forceStripes = "true";
              maxStripes = "2";
              showOnlyCurrentDesktop = "false";
              unhideOnAttention = "false";
            };
          }
          "org.kde.plasma.panelspacer"
          {
            name = "org.kde.plasma.systemtray";
            config = {
              General = {
                iconSpacing = "1";
                showAllItems = "true";
              };
            };
          }
          {
            name = "org.kde.plasma.digitalclock";
            config.Appearance = {
              dateDisplayFormat = "adaptive";
              fontWeight = "400";
              showSeconds = "2";
            };
          }
        ];
      } 
    ];

    kwin = {
      titlebarButtons = {
        left = [ "close" "minimize" "maximize" "help" ];
        right = [ "keep-above-windows" "on-all-desktops" ];
      };
      effects = {
        shakeCursor.enable = true;
        translucency.enable = true;
        wobblyWindows.enable = true;
        cube.enable = true;
        blur.enable = false;
      };
      virtualDesktops = {
        rows = 2;
        number = 4;
      };
      borderlessMaximizedWindows = false;
      nightLight = {
        enable = true;
        mode = "location";
        location = {
          latitude = "-25.4430715";
          longitude = "-49.2396095";
        };
      };
    };
    kscreenlocker = {
      wallpaperPictureOfTheDay.provider = "bing";
    };
    spectacle.shortcuts = {
      captureActiveWindow = "Meta+Print";
      captureCurrentMonitor = "Meta+Shift+S";
      captureEntireDesktop = "Shift+Print";
      captureRectangularRegion = "Print";
      captureWindowUnderCursor = "Meta+Ctrl+Print";
      launch = "";
      launchWithoutCapturing = "";
    };
    shortcuts = {
      "kwin" = {
        "Window Close" = ["Meta+Shift+Q" "Alt+F4"];
        "Switch to Desktop 1" = [ "Meta+1" ];
        "Switch to Desktop 2" = [ "Meta+2" ];
        "Switch to Desktop 3" = [ "Meta+3" ];
        "Switch to Desktop 4" = [ "Meta+4" ];
        "Window to Desktop 1" = [ "Meta+Shift+1" ];
        "Window to Desktop 2" = [ "Meta+Shift+2" ];
        "Window to Desktop 3" = [ "Meta+Shift+3" ];
        "Window to Desktop 4" = [ "Meta+Shift+4" ];
      };

      "plasmashell" = {
        "activate task manager entry 1" = [];
        "activate task manager entry 2" = [];
        "activate task manager entry 3" = [];
        "activate task manager entry 4" = [];
      };

      "org.kde.dolphin.desktop"."_launch" = "Meta+E";
    };
    /**/
    fonts = {
      general = {
        family = "Fira Sans";
        pointSize = 10;
      };
      fixedWidth = {
        family = "FiraCode Nerd Font Mono";
        pointSize = 10;
      };
      small = {
        family = "Fira Sans";
        pointSize = 8;
      };
      toolbar = {
        family = "Fira Sans";
        pointSize = 10;
      };
      menu = {
        family = "Fira Sans";
        pointSize = 10;
      };
      windowTitle = {
        family = "Fira Sans";
        pointSize = 10;
      };
    };
    configFile = {
      "baloofilerc"."Basic Settings"."Indexing-Enabled" = false;

      "kdeglobals" = {
        "KDE"."widgetStyle" = "Oxygen";
      };

      "ksmserverrc"."General"."loginMode" = "emptySession";

      "krunnerrc" = {
        "General"."FreeFloating" = true;
        "Plugins"."baloosearchEnabled" = false;
      };

      "kxkbrc"."Layout" = {
        "DisplayNames" = ",";
        "LayoutList" = "br,br,br";
        "Use" = true;
        "VariantList" = ",thinkpad,nativo";
      };

      "plasmarc"."Theme"."name" = "oxygen";

      "plasma-localerc"."Formats"."LANG" = "pt_BR.UTF-8";
    };
  };

  programs.konsole = {
    profiles = [
      {
        name = "abacate";
        colorScheme = "Gruvbox";
        font = {
          name = "FiraCode Nerd Font Mono";
          size = 10;
        };
      }
    ];
    defaultProfile = "abacate";
  };
}
