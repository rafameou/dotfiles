{ config, inputs, pkgs, ... }:
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

    #(callPackage ./kde/crystal-dock.nix {})

    /* -- for neovim --*/
    wl-clipboard

    /* -- apps --*/
    kdePackages.kpat
    kdePackages.kmines

    kdePackages.kcalc
    kdePackages.kalk
    kdePackages.discover
    kdePackages.kdeconnect-kde

    kdePackages.kdenlive
    krita
    kdePackages.filelight
    kdePackages.kolourpaint
    kdePackages.kcolorchooser
    kdePackages.yakuake
    #kdePackages.kompare
    kdePackages.kruler
    kdePackages.kteatime
    kdePackages.falkon
    #kdePackages.lokalize
    kdePackages.akregator #remove one after testing
    kdePackages.alligator
    kdePackages.kmines
    kdePackages.ksudoku
    kdePackages.kapman
    kdePackages.kblocks
    kdePackages.kbounce
    #kdePackages.kwave
    kdePackages.knotes
    kdePackages.ghostwriter
    kdePackages.kmplot
    kdePackages.keysmith
    kdePackages.tokodon
    kdePackages.plasmatube
    #labplot

    ktailctl

    kaffeine
  ];

  programs.plasma = {
    enable = true;
    /*workspace = {
    lookAndFeel = null;#"org.kde.oxygen";
    theme = "default";#"oxygen";
    colorScheme = "Gruvbox";#"Oxygen";
    iconTheme = "breeze-dark";#"oxygen";
    cursor.theme = "breeze_cursors";#"Oxygen_Zion";
    soundTheme = "ocean";
    splashScreen = {
    engine = "none";
    theme = "None";
    };
    windowDecorations = {
    library = "org.kde.oxygen";
    theme = "Oxygen";
    };
      #wallpaper = config.stylix.image;
      };*/
      /*startup = {
      startupScript = {
      trayscale.text = "ktailctl";
      crystal-dock.text = "crystal-dock";
      };
      };*/
      panels = 
      [ 
        {
          location = "top";
          floating = false;
          height = 24;
          widgets = 
          [
          #"org.kde.windowbuttons"
          { 
            name = "com.github.antroids.application-title-bar";
            config = {
              Appearance = {
                overrideElementsMaximized = "true";
                widgetButtonsIconsTheme = "Oxygen";
                widgetElements = "windowCloseButton,windowMinimizeButton,windowMaximizeButton,spacer,windowIcon,windowTitle";#"windowIcon,windowTitle";
                widgetElementsMaximized = "windowCloseButton,windowMinimizeButton,windowMaximizeButton,spacer,windowIcon,windowTitle";
                windowTitleSource = "AppName";
                windowTitleSourceMaximized = "Decoration";
                windowTitleUndefined = "Plasma Desktop";
              };
            };
          }
          "org.kde.plasma.appmenu"
        ];
      }
      {
        location = "bottom";
        floating = false;
        height = 24;
        widgets = [
          {
            name = "org.kde.plasma.kickoff";
            config.General = {
              icon = "kde-symbolic";#"nix-snowflake-white";
              showRecentDocs = "false";
              useCustomButtonImage = "true";
            };
          }
          {
            name = "org.kde.plasma.windowlist";
            config = {
              General = {
                showText = "false";
              };
            };
          }
          /*"org.kde.plasma.panelspacer"*/
          {
            name = "org.kde.plasma.systemtray";
            config = {
              General = {
                iconSpacing = "1";
                #showAllItems = "true";
              };
            };
          }
          {
            name = "org.kde.plasma.digitalclock";
            config.Appearance = {
              dateDisplayFormat = "BesideTime";
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
      borderlessMaximizedWindows = true;
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
      appearance.wallpaperPictureOfTheDay.provider = "bing";
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

      /*"kdeglobals" = {
      "KDE"."widgetStyle" = "Oxygen";
      };*/

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

      /*"plasmarc"."Theme"."name" = "oxygen";*/

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

  home.file = {
    ".crystal-dock-2/KDE/panel_1.conf".text = ''
      [General]
      autoHide=true
      launchers="firefox;google-chrome;thunderbird;bitwarden;org.telegram.desktop;vesktop;org.kde.konsole;org.kde.dolphin;org.octave.Octave;onlyoffice-desktopeditors;startcenter;org.kde.kpat;steam;org.strawberrymusicplayer.strawberry;feishin;smartcode-stremio;virt-manager;org.kde.plasma-systemmonitor"
      position=1
      screen=0
      showApplicationMenu=false
      showClock=false
      showPager=false
      showTaskManager=true
      visibility=1
    '';
    ".crystal-dock-2/KDE/appearance.conf".text = ''
      [General]
      activeIndicatorColor=#b8bb26
      backgroundColor=#f4282828
      borderColor=#1d2021
      floatingMargin=2
      inactiveIndicatorColor=#b16286
      maximumIconSize=128
      minimumIconSize=48
      panelStyle=0
      showBorder=true
      spacingFactor=0.4
      tooltipFontSize=12

      [Application%20Menu]
      backgroundAlpha=0.8
      fontSize=14
      label=Applications

      [Clock]
      fontScaleFactor=1
      use24HourClock=true

      [TaskManager]
      currentDesktopTasksOnly=false
    '';
  };
}
