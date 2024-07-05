{ inputs, pkgs, ... }:
{
  imports = [
    inputs.plasma-manager.homeManagerModules.plasma-manager
  ];

  qt = {
    enable = true;
    platformTheme.name = "kde";
  };

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

    #kdePackages.konsole

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
    };
    panels = 
    [ 
      {
        location = "bottom";
        floating = false;
        height = 24;
        widgets = 
        [
          {
            name = "org.kde.plasma.taskmanager";
            config.General = {
              launchers = "";
              maxStripes = "1";
              showOnlyCurrentDesktop = "false";
              unhideOnAttention = "false";
            };
          }
          "org.kde.plasma.panelspacer"
          {
            name = "org.kde.plasma.pager";
            config.General = {
              showWindowIcons = "true";
            };
          }
        ];
      } 
      {
        location = "top";
        floating = false;
        height = 24;
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
          "org.kde.plasma.panelspacer"
          {
            name = "org.kde.plasma.systemtray";
            config = {
              General = {
                iconSpacing = "1";
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

    kwin.titlebarButtons = {
      left = [ "on-all-desktops" "keep-above-windows" ];
      right = [ "help" "minimize" "maximize" "close" ];
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
    configFile = {
      "baloofilerc"."Basic Settings"."Indexing-Enabled" = false;

      "kdeglobals" = {
        "General" = {
          "fixed" = "FiraCode Nerd Font Mono,10,-1,5,50,0,0,0,0,0";
          "font" = "Fira Sans,10,-1,5,29,0,0,0,0,0,Book";
          "menuFont" = "Fira Sans,10,-1,5,29,0,0,0,0,0,Book";
          "smallestReadableFont" = "Fira Sans,8,-1,5,29,0,0,0,0,0,Book";
          "toolBarFont" = "Fira Sans,10,-1,5,29,0,0,0,0,0,Book";
        };
        "KDE"."widgetStyle" = "Oxygen";
        "WM"."activeFont" = "Fira Sans,10,-1,5,29,0,0,0,0,0,Book";
      };

      "kscreenlockerrc"."Greeter.Wallpaper.org.kde.potd.General"."Provider" = "bing";

      "ksmserverrc"."General"."loginMode" = "emptySession";

      "krunnerrc" = {
        "General"."FreeFloating" = true;
        "Plugins"."baloosearchEnabled" = false;
      };

      #"kwalletrc"."Wallet"."First Use" = false;

      "kwinrc" = {
        "Desktops" = {
          "Number" = 4;
          "Rows" = 1;
        };
        "NightColor"."Active" = true;
        "Plugins" = {
          "blurEnabled" = false;
          "cubeEnabled" = true;
          "slidingpopupsEnabled" = false;
        };
        "Windows" = {
          "BorderlessMaximizedWindows" = false;
          "RollOverDesktops" = false;
        };
        "Xwayland"."Scale" = 1;
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
}
