{ inputs, config, lib, pkgs, ... }:
let 
  base00 = inputs.nix-colors.lib.conversions.hexToRGB config.colorScheme.palette.base00;
  base00_rgb = lib.lists.forEach base00 (x: x / 255.0); 
  base00_rgba = base00_rgb ++ [ 0.9 ];

  base05 = inputs.nix-colors.lib.conversions.hexToRGB config.colorScheme.palette.base05;
  base05_rgb = lib.lists.forEach base05 (x: x / 255.0); 
  base05_rgba = base05_rgb ++ [ 1.0 ];
  base05_rgba_alt = base05_rgb ++ [0.5]; 
in
{
  imports = [
    ../qt-theme.nix
    ../nix-colors.nix
  ];
  home.packages = with pkgs; [
    gnome.gnome-software
    gnome.gnome-tweaks
    gnome.dconf-editor
    gnome-frog
    #gnome-builder
    # ---- gnome extensions ----
    gnomeExtensions.runcat
    gnomeExtensions.appindicator
    /*gnomeExtensions.openweather*/
    gnomeExtensions.alphabetical-app-grid
    gnomeExtensions.favourites-in-appgrid
    /*gnomeExtensions.hot-edge*/
    gnomeExtensions.caffeine
    gnomeExtensions.activate_gnome
    gnomeExtensions.tailscale-status
    gnomeExtensions.wiggle
    gnomeExtensions.gsconnect
    /*gnomeExtensions.space-bar*/
    /*gnomeExtensions.dash-to-dock*/
    /*gnomeExtensions.dash2dock-lite*/
    gnomeExtensions.dash-to-panel
    gnomeExtensions.add-to-desktop
    gnomeExtensions.gtk4-desktop-icons-ng-ding
    # ---- gnome fixes ----
    adwaita-qt
    adwaita-qt6
    libsForQt5.qt5.qtwayland
    kdePackages.qtwayland

    wl-clipboard 
    xclip

    wayland-pipewire-idle-inhibit 
  ];

  home.sessionVariables = {
    QT_QPA_PLATFORM = "xcb"; #fixes https://gitlab.gnome.org/GNOME/mutter/-/issues/3435
  };

  systemd.user.services = {
    wayland-idle-pipewire-inhibit-serv = {
      Unit = {
        Wants = "graphical-session.target";
        After = "graphical-session.target";
      };

      Service = {
        Type = "simple";
        ExecStart = "${pkgs.wayland-pipewire-idle-inhibit}/bin/wayland-pipewire-idle-inhibit -b -d 5";
        Restart = "on-failure";
        RestartSec = 30;
      };

      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
    };
  };

  gtk = {
    enable = true;
    font = {
      name = "Fira Sans";
      size = 11;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/session" = {
      idle-delay = 60;
    };
    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = true;
    };
    "org/gnome/shell/keybindings" = {
      switch-to-application-1 = ["<Super><Control>1"];
      switch-to-application-2 = ["<Super><Control>2"];
      switch-to-application-3 = ["<Super><Control>3"];
      switch-to-application-4 = ["<Super><Control>4"];
      switch-to-application-5 = ["<Super><Control>5"];
      switch-to-application-6 = ["<Super><Control>6"];
      switch-to-application-7 = ["<Super><Control>7"];
      switch-to-application-8 = ["<Super><Control>8"];
      switch-to-application-9 = ["<Super><Control>9"];
    };
    "org/gnome/desktop/wm/keybindings" = {
      close = ["<Alt>F4" "<Shift><Super>q"];
      switch-to-workspace-1 = ["<Super>Home" "<Super>1"];
      switch-to-workspace-2 = ["<Super>2"];
      switch-to-workspace-3 = ["<Super>3"];
      switch-to-workspace-4 = ["<Super>4"];
      switch-to-workspace-5 = ["<Super>5"];
      switch-to-workspace-6 = ["<Super>6"];
      switch-to-workspace-7 = ["<Super>7"];
      switch-to-workspace-8 = ["<Super>8"];
      switch-to-workspace-9 = ["<Super>9"];
      move-to-workspace-1 = ["<Super><Shift>Home" "<Super><Shift>1"]; 
      move-to-workspace-2 = ["<Super><Shift>2"];
      move-to-workspace-3 = ["<Super><Shift>3"];
      move-to-workspace-4 = ["<Super><Shift>4"];
      move-to-workspace-5 = ["<Super><Shift>5"];
      move-to-workspace-6 = ["<Super><Shift>6"];
      move-to-workspace-7 = ["<Super><Shift>7"];
      move-to-workspace-8 = ["<Super><Shift>8"];
      move-to-workspace-9 = ["<Super><Shift>9"];
    };
    "org/gnome/shell/window-switcher" = {
      current-workspace-only = true;
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
      titlebar-font = "Fira Sans 11";
    };
    "org/gnome/desktop/interface" = {
      clock-show-date = true;
      clock-show-seconds = true;
      clock-show-weekday = true;
      show-battery-percentage = true;
      font-name = "Fira Sans 11";
      document-font-name = "Fira Sans 11";
    };
    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
    };
    "org/gtk/settings/file-chooser" = {
      sort-directories-first = true;
    };
    "org/gtk/gtk4/settings/file-chooser" = {
      sort-directories-first = true;
    };
    "org/gnome/shell" = {
      favorite-apps = [
        /*firefoxpwa generates random ids for the desktop files, I recommend renaming and moving then to a folder.*/
        #"org.qutebrowser.qutebrowser.desktop"
        /*"firefox.desktop"
        "google-chrome.desktop"
        "thunderbird.desktop"
        "org.codeberg.dnkl.foot.desktop"
        "org.gnome.Nautilus.desktop"
        "bitwarden.desktop"
        "FFW-Jellyfin.desktop"
        "FFW-Mastodon.desktop"
        "org.telegram.desktop.desktop" 
        "vesktop.desktop"
        "FFW-WhatsApp.desktop" */
      ];
      disable-user-extensions = false;
      enabled-extensions = [
        "runcat@kolesnikov.se"
        "appindicatorsupport@rgcjonas.gmail.com"
        /*"openweather-extension@jenslody.de"*/
        "AlphabeticalAppGrid@stuarthayhurst"
        "favourites-in-appgrid@harshadgavali.gitlab.org"
        /*"hotedge@jonathan.jdoda.ca"*/
        "caffeine@patapon.info"
        "tailscale-status@maxgallup.github.com"
        "wiggle@mechtifs"
        "gsconnect@andyholmes.github.io"
        /*"space-bar@luchrioh"*/
        /*"dash-to-dock@micxgx.gmail.com"*/
        /*"dash2dock-lite@icedman.github.com"*/
        "dash-to-panel@jderose9.github.com"
        "gtk4-ding@smedius.gitlab.com" 
        "add-to-desktop@tommimon.github.com"
      ];
    };
    "org/gnome/shell/extensions/dash-to-dock" = {
      background-color = "rgb(0,0,0)";
      background-opacity = 0.7;
      click-action = "minimize";
      custom-background-color = true;
      customize-alphas = true;
      custom-theme-shrink = true;
      dock-fixed = true;
      dock-position = "LEFT";
      extend-height = true;
      hot-keys = false;
      icon-size-fixed = true;
      multi-monitor = true;
      running-indicator-style = "DOTS";
      show-mounts-network = true;
      transparency-mode = "FIXED";
    };
    "org/gnome/shell/extensions/dash2dock-lite" = {
      animation-bounce = 0.75;
      animation-fps = 0;
      apps-icon = true;
      autohide-dash = true;
      autohide-dodge = true;
      autohide-speed = 0.5;
      background-color = lib.hm.gvariant.mkTuple base00_rgba;
      border-color = lib.hm.gvariant.mkTuple base05_rgba_alt;
      border-radius = 3;
      border-thickness = 1;
      clock-icon = true;
      clock-style = 2;
      customize-label = true;
      customize-topbar = true;
      dock-location = 0;
      dock-padding = 1;
      edge-distance = 0.5;
      mounted-icon = true;
      multi-monitor-preference = 1;
      open-app-animation = true;
      preferred-monitor = 0;
      pressure-sense = false;
      running-indicator-style = 3;
      running-indicator-color = lib.hm.gvariant.mkTuple base05_rgba;
      shrink-icons = true;
      topbar-background-color = lib.hm.gvariant.mkTuple base00_rgba;
      topbar-foreground-color = lib.hm.gvariant.mkTuple base05_rgba;
      topbar-border-thickness = 0;
      trash-icon = true;
    };
    "org/gnome/shell/extensions/dash-to-panel" = {
      animate-appicon-hover = false;
      appicon-margin = 0;
      appicon-padding = 4;
      dot-color-dominant = true;
      dot-position = "TOP";
      dot-size = 2;
      focus-highlight-dominant = true;
      group-apps = false;
      hotkeys-overlay-combo = "TEMPORARILY";
      intellihide = false;
      isolate-workspaces = false;
      leftbox-padding = 4;
      panel-positions = ''{"0":"BOTTOM"}''; 
      panel-sizes = ''{"0":32}'';
      scroll-icon-action = "PASS_THROUGH";
      show-apps-icon-file = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake-white.svg";
      status-icon-padding = 4;
      trans-bg-color = "#${config.colorScheme.palette.base00}";
      trans-gradient-bottom-color = "#000000";
      trans-gradient-bottom-opacity = 0.3;
      trans-gradient-top-color = "#000000";
      trans-gradient-top-opacity = 0.0;
      trans-panel-opacity = 0.9;
      trans-use-custom-bg = true;
      trans-use-custom-gradient = true;
      trans-use-custom-opacity = true;
      trans-use-dynamic-opacity = false;
      tray-padding = 4;
      window-preview-title-position = "TOP";
    };
    "org/gnome/shell/extensions/gtk4-ding" = {
      arrangeorder = "NAME";
      keep-arranged = true;
      show-network-volumes = true;
      start-corner = "top-left";#"top-right";
    };
    "org/gnome/desktop/app-folders" = {
      /*https://github.com/BenJetson/gnome-dash-fix*/
      #folder-children = [];
      folder-children = ["accessories" "chrome-apps" "games" "graphics" "internet" "office" "programming" "science" "sound---video" "system-tools" "universal-access" "wine"];
    };
    "org/gnome/desktop/app-folders/folders/accessories" = {
      name = "Accessories";
      categories = ["Utility"];
    };
    "org/gnome/desktop/app-folders/folders/chrome-apps" = {
      name = "Chrome Apps";
      categories = ["chrome-apps"];
    };
    "org/gnome/desktop/app-folders/folders/games" = {
      name = "Games";
      categories = ["Game"];
    };
    "org/gnome/desktop/app-folders/folders/graphics" = {
      name = "Graphics";
      categories = ["Graphics"];
    };
    "org/gnome/desktop/app-folders/folders/internet" = {
      name = "Internet";
      categories = ["Network" "WebBrowser" "Email"];
    };
    "org/gnome/desktop/app-folders/folders/office" = {
      name = "Office";
      categories = ["Office"];
    };
    "org/gnome/desktop/app-folders/folders/programming" = {
      name = "Programming";
      categories = ["Development"];
    };
    "org/gnome/desktop/app-folders/folders/science" = {
      name = "Science";
      categories = ["Science"];
    };
    "org/gnome/desktop/app-folders/folders/sound---video" = {
      name = "Sound & Video";
      categories = ["AudioVideo" "Audio" "Video"];
    };
    "org/gnome/desktop/app-folders/folders/system-tools" = {
      name = "System Tools";
      categories = ["System" "Settings"];
    };
    "org/gnome/desktop/app-folders/folders/universal-access" = {
      name = "Universal Access";
      categories = ["Accessibility"];
    };
    "org/gnome/desktop/app-folders/folders/wine" = {
      name = "Wine";
      categories = ["Wine" "X-Wine" "Wine-Programs-Accessories"];
    };
  };
}
