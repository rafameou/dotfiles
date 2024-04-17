{ pkgs, ... }:
{
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
    # ---- gnome fixes ----
    adwaita-qt
    adwaita-qt6
    libsForQt5.qt5.qtwayland
    kdePackages.qtwayland

    wl-clipboard 
    wl-clipboard-x11
  ];

  qt = {
    enable = true;
    #platformTheme = "gnome";
    #style.name = "adwaita";
  };

  dconf.settings = {
    "org/gnome/mutter" = {
      dynamic-workspaces = true;
    };
    "org/gnome/shell/keybindings" = {
      switch-to-application-1 = ["<Super><Shift>1"];
      switch-to-application-2 = ["<Super><Shift>2"];
      switch-to-application-3 = ["<Super><Shift>3"];
      switch-to-application-4 = ["<Super><Shift>4"];
      switch-to-application-5 = ["<Super><Shift>5"];
      switch-to-application-6 = ["<Super><Shift>6"];
      switch-to-application-7 = ["<Super><Shift>7"];
      switch-to-application-8 = ["<Super><Shift>8"];
      switch-to-application-9 = ["<Super><Shift>9"];
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
        "org.qutebrowser.qutebrowser.desktop"
        "google-chrome.desktop"
        "org.codeberg.dnkl.foot.desktop"
        "org.gnome.Nautilus.desktop"
        "org.telegram.desktop.desktop"
        "vesktop.desktop"
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
      ];
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
