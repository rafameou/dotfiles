{ config, inputs, pkgs, ... }:
{
  # imports = [
  #   inputs.plasma-manager.homeManagerModules.plasma-manager
  # ];

  /*qt = {
  enable = true;
  platformTheme.name = "kde";
  };*/

  home.packages = with pkgs; [
    dconf-editor

    kde-gruvbox
    gruvbox-dark-gtk

    (callPackage ./kde/crystal-dock.nix {})
    #crystal-dock

    /* -- for neovim --*/
    wl-clipboard

    /* -- apps --*/
    kdePackages.kpat
    kdePackages.kmines

    kdePackages.kcalc
    kdePackages.kalk
    kdePackages.discover
    kdePackages.kdeconnect-kde

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
    #kdePackages.knotes
    kdePackages.ghostwriter
    kdePackages.kmplot
    kdePackages.keysmith
    kdePackages.tokodon
    kdePackages.plasmatube
    #labplot

    kdePackages.wallpaper-engine-plugin
    kdePackages.applet-window-buttons6
    kara

    ktailctl

    kaffeine
  ];

/*  programs.plasma = {
    enable = true;
    panels = 
    [ 
      {
        location = "top";
        floating = false;
        height = 24;
        widgets = 
        [
          {
            name = "org.kde.plasma.kickoff";
            config.General = {
              icon = "kde-symbolic";#"nix-snowflake-white";
              showRecentDocs = "false";
              useCustomButtonImage = "true";
            };
          }
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
          "org.kde.plasma.pager"
          #"org.kde.plasma.appmenu"
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
        cube.enable = false;
        blur.enable = false;
      };
      virtualDesktops = {
        rows = 1;
        number = 10;
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
        "Switch to Desktop 5" = [ "Meta+5" ];
        "Switch to Desktop 6" = [ "Meta+6" ];
        "Switch to Desktop 7" = [ "Meta+7" ];
        "Switch to Desktop 8" = [ "Meta+8" ];
        "Switch to Desktop 9" = [ "Meta+9" ];
        "Switch to Desktop 0" = [ "Meta+0" ]; 
        "Window to Desktop 1" = [ "Meta+Shift+1" ];
        "Window to Desktop 2" = [ "Meta+Shift+2" ];
        "Window to Desktop 3" = [ "Meta+Shift+3" ];
        "Window to Desktop 4" = [ "Meta+Shift+4" ];
        "Window to Desktop 5" = [ "Meta+Shift+5" ];
        "Window to Desktop 6" = [ "Meta+Shift+6" ];
        "Window to Desktop 7" = [ "Meta+Shift+7" ];
        "Window to Desktop 8" = [ "Meta+Shift+8" ];
        "Window to Desktop 9" = [ "Meta+Shift+9" ];
        "Window to Desktop 0" = [ "Meta+Shift+0" ]; 

        "Show Desktop" = []; # Meta + D
      };

      "plasmashell" = {
        "activate task manager entry 1" = [];
        "activate task manager entry 2" = [];
        "activate task manager entry 3" = [];
        "activate task manager entry 4" = [];
        "activate task manager entry 5" = [];
        "activate task manager entry 6" = [];
        "activate task manager entry 7" = [];
        "activate task manager entry 8" = [];
        "activate task manager entry 9" = [];
        "activate task manager entry 10" = [];

        "manage activities" = []; # Meta + Q
        "next activity" = []; # Meta + A 
      };

      "org.kde.dolphin.desktop"."_launch" = "Meta+E";
    };
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

      "ksmserverrc"."General"."loginMode" = "emptySession";

      "krunnerrc" = {
        "General"."FreeFloating" = true;
        "Plugins"."baloosearchEnabled" = false;
      };

      "kxkbrc"."Layout" = {
        "DisplayNames" = ",";
        "LayoutList" = "br,br,us";
        "Use" = true;
        "VariantList" = ",thinkpad,alt-intl";
      };

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
          size = 12;
        };
      }
    ];
    defaultProfile = "abacate";
  };*/

 home.file = {
    ".crystal-dock-2/KDE/panel_1.conf".text = ''
      [General]
      autoHide=false
      launchers="librewolf;chromium-browser;org.telegram.desktop;vesktop;emacs;org.kde.konsole;bitwarden;org.kde.dolphin;org.octave.Octave;onlyoffice-desktopeditors;startcenter;com.zettlr.zettlr;zettlr;dev.zed.zed;gimp;org.kde.krita;org.kde.kpat;steam;org.strawberrymusicplayer.strawberry;smartcode-stremio;xsane;virt-manager;org.kde.plasma-systemmonitor;org.kde.discover"
      position=1
      screen=0
      showApplicationMenu=false
      showClock=false
      showPager=false
      showTaskManager=true
      visibility=3
    '';
    ".crystal-dock-2/KDE/appearance.conf".text = ''
      [General]
      activeIndicatorColor=#b8bb26
      backgroundColor=#f4282828
      borderColor=#b1c4de
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
