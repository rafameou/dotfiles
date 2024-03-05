{ inputs, pkgs, ... }:
{
  imports = [
    inputs.plasma-manager.homeManagerModules.plasma-manager
  ];
  /* for some reason this trigger rebuilding the entire oxygen theme */
  /*nixpkgs.overlays = [ (final: prev: {
    kdePackages = prev.kdePackages.overrideScope (qt6final: qt6prev: {
      oxygen-icons = qt6prev.oxygen-icons.overrideAttrs (old: {
        postInstall = (old.postInstall or "") + ''
          sed -i -e 's/Inherits=hicolor/Inherits=breeze-dark,breeze,hicolor/g' "$out/share/icons/oxygen/index.theme"
        '';
      });
      # maybe fix qt5's oxygen here as well?
    });
  }) ];*/
  home.packages = with pkgs; [
    gnome.dconf-editor

    kdePackages.oxygen
    kdePackages.oxygen.qt5 
    kdePackages.oxygen-sounds
    kdePackages.oxygen-icons

    kde-gruvbox
    gruvbox-dark-gtk

    /* -- for neovim --*/
    wl-clipboard

    /* -- apps --*/
    kdePackages.kpat
    kdePackages.kmines
    kdePackages.kmines

    kdePackages.kcalc
    kdePackages.kalk
    kdePackages.discover

    kdePackages.konsole

    kaffeine
  ];

  programs.plasma = {
    enable = true;
    workspace = {
      theme = "oxygen";
      colorScheme = "ObsidianCoast"; #"Gruvbox";
      iconTheme = "oxygen";
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
