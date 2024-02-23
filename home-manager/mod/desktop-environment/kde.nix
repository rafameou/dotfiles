{ inputs, lib, config, pkgs, ... }:
{
  imports = [
    inputs.plasma-manager.homeManagerModules.plasma-manager 
  ];
  home.packages = with pkgs; [
    gnome.dconf-editor

    libsForQt5.oxygen
    libsForQt5.oxygen-sounds
    libsForQt5.oxygen-icons5

    kde-gruvbox
    gruvbox-dark-gtk

    /* -- for neovim --*/
    wl-clipboard

    /* -- apps --*/
    libsForQt5.kpat
    libsForQt5.kmines
    libsForQt5.kmines

    libsForQt5.kcalc
    libsForQt5.kalk
    libsForQt5.discover

    kaffeine
  ];

  programs.plasma = {
    enable = true;
    workspace = {
      theme = "oxygen";
      colorScheme = "GruvBox";
      iconTheme = "Oxygen";
      cursorTheme = "Oxygen_Zion";
      lookAndFeel = "org.kde.oxygen";
    };
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

      "kwalletrc"."Wallet"."First Use" = false;

      "kwinrc" = {
        "NightColor"."Active" = true;
        "Plugins" = {
          "blurEnabled" = false;
          "slidingpopupsEnabled" = false;
        };
        "Windows"."RollOverDesktops" = true;
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
