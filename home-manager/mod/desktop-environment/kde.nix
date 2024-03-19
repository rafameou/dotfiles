{ inputs, pkgs, ... }:
{
  imports = [
    inputs.plasma-manager.homeManagerModules.plasma-manager
  ];

  home.packages = with pkgs; [
    gnome.dconf-editor

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

    kdePackages.konsole

    kaffeine
  ];

  programs.plasma = {
    enable = true;
    workspace = {
      theme = "oxygen";
      colorScheme = "ObsidianCoast"; #"Gruvbox";
      iconTheme = "Haiku";
      cursorTheme = "Oxygen_Zion";
      lookAndFeel = "org.kde.oxygen";
    };
    panels = 
    [ 
      {
        location = "top";
        floating = true;
        height = 32;
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
          /*{
            name = "org.kde.plasma.folder";
            config.General = {
              url = "file:///home/rafameou";
              viewMode = "1";
            };
          }*/
          "org.kde.plasma.appmenu"
          "org.kde.plasma.panelspacer"
          {
            name = "org.kde.plasma.systemtray";
            config = {
              General = {
                iconSpacing = "1";
                /*showAllItems = true;*/
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
      {
        location = "bottom";
        floating = true;
        hiding = "autohide"; #"dodgewindows";
        height = 42;
        widgets = [
          {
            name = "org.kde.plasma.taskmanager";
            config.General = {
              launchers = "";
              maxStripes = "2";
              showOnlyCurrentDesktop = "false";
              unhideOnAttention = "false";
            };
          }
          {
            name = "org.kde.plasma.pager";
            config.General = {
              showWindowIcons = "true";
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
      "kwin"."Window Close" = ["Meta+Shift+Q" "Alt+F4"];

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

      "kwalletrc"."Wallet"."First Use" = false;

      "kwinrc" = {
        "Desktops" = {
          "Number" = 4;
          "Rows" = 2;
        };
        "NightColor"."Active" = true;
        "Plugins" = {
          "blurEnabled" = false;
          "cubeEnabled" = true;
          "slidingpopupsEnabled" = false;
        };
        "Windows" = {
          "BorderlessMaximizedWindows" = true;
          "RollOverDesktops" = true;
        };
        "Xwayland"."Scale" = 1;
      };

      "kxkbrc"."Layout" = {
        "DisplayNames" = ",";
        "LayoutList" = "br,br";
        "Use" = true;
        "VariantList" = ",thinkpad";
      };

      "plasmarc"."Theme"."name" = "oxygen";

      "plasma-localerc"."Formats"."LANG" = "pt_BR.UTF-8";
    };
  };
}
