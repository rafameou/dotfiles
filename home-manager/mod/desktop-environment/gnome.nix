{ pkgs, ... }:
{
  imports = [
    ../qt-theme.nix
  ];
  home.packages = with pkgs; [
    gnome.gnome-software
    gnome.gnome-tweaks
    gnome.dconf-editor
    #gnome-builder
    # ---- gnome extensions ----
    gnomeExtensions.runcat
    gnomeExtensions.appindicator
    gnomeExtensions.openweather
    gnomeExtensions.alphabetical-app-grid
    gnomeExtensions.favourites-in-appgrid
    gnomeExtensions.hot-edge
    gnomeExtensions.caffeine
    gnomeExtensions.activate_gnome
    gnomeExtensions.tailscale-status
    gnomeExtensions.wiggle
    gnomeExtensions.gsconnect
    gnomeExtensions.space-bar
    gnomeExtensions.dash-to-dock
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
      clock-show-seconds = true;
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
        #"org.qutebrowser.qutebrowser.desktop"
        "firefox.desktop"
        "google-chrome.desktop"
        "thunderbird.desktop"
        "org.codeberg.dnkl.foot.desktop"
        "org.gnome.Nautilus.desktop"
        "bitwarden.desktop"
        "FFPWA-01HW1V2SSJNS119YHVTMAPH84B.desktop"
        "org.telegram.desktop.desktop"
        "vesktop.desktop"
        "FFPWA-01HW1THWX3JTR1MWVRMQBVTNQJ.desktop"
        "FFPWA-01HW1TJJNJPTBJWC49DK57HRFP.desktop"
      ];
      disable-user-extensions = false;
      enabled-extensions = [
        "runcat@kolesnikov.se"
        "appindicatorsupport@rgcjonas.gmail.com"
        "openweather-extension@jenslody.de"
        "AlphabeticalAppGrid@stuarthayhurst"
        "favourites-in-appgrid@harshadgavali.gitlab.org"
        "hotedge@jonathan.jdoda.ca"
        "caffeine@patapon.info"
        "tailscale-status@maxgallup.github.com"
        "wiggle@mechtifs"
        "gsconnect@andyholmes.github.io"
        "space-bar@luchrioh"
        "dash-to-dock@micxgx.gmail.com"
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
    "org/gnome/desktop/app-folders" = {
      /*https://github.com/BenJetson/gnome-dash-fix*/
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
