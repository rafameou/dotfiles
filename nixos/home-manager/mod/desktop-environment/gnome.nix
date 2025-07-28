{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    #gnome.gnome-software
    gnome-tweaks
    dconf-editor
    #gnome-builder
    # ---- gnome extensions ----
    gnomeExtensions.runcat
    gnomeExtensions.appindicator
    gnomeExtensions.alphabetical-app-grid
    # gnomeExtensions.favourites-in-appgrid
    gnomeExtensions.hot-edge
    gnomeExtensions.caffeine
    gnomeExtensions.tailscale-status
    #gnomeExtensions.wiggle
    gnomeExtensions.gsconnect
    gnomeExtensions.space-bar
    #gnomeExtensions.add-to-desktop
    #gnomeExtensions.gtk4-desktop-icons-ng-ding
    #gnomeExtensions.just-perfection
    gnomeExtensions.solaar-extension
    gnomeExtensions.dash-to-dock
    gnomeExtensions.vitals
    gnomeExtensions.weather-or-not
    gnomeExtensions.status-area-horizontal-spacing
    /*
      gnomeExtensions.weather-oclock
      gnomeExtensions.activate_gnome
      gnomeExtensions.blur-my-shell
    */
    gnomeExtensions.paperwm
    # ---- gnome fixes ----
    adw-gtk3
    adwaita-qt
    adwaita-qt6
    kdePackages.qtwayland

    wl-clipboard
    xclip

    wayland-pipewire-idle-inhibit

    ptyxis
    planify
    eyedropper
    newsflash
    resources
    gnome-decoder
    tuba
    valuta
    polari
    fractal
    gnome-graphs
  ];

  #home.sessionVariables = {
  #  QT_QPA_PLATFORM = "xcb"; #fixes https://gitlab.gnome.org/GNOME/mutter/-/issues/3435
  #};

  /*
    gtk = {
    enable = true;
    font = {
    name = "Fira Sans";
    size = 11;
    };
    theme = {
    name = "adw-gtk3-dark";
    package = pkgs.adw-gtk3;
    };
    };
  */

  /*
    home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "phinger-cursors-light";
    package = pkgs.phinger-cursors;
    };
  */

  dconf.settings = {
    "org/gnome/desktop/session" = {
      idle-delay = 60;
    };
    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = true;
      experimental-features = [
        "scale-monitor-framebuffer"
        "xwayland-native-scaling"
        "variable-refresh-rate"
      ];
    };
    "org/gnome/shell/keybindings" = {
      switch-to-application-1 = [ "<Super><Control>1" ];
      switch-to-application-2 = [ "<Super><Control>2" ];
      switch-to-application-3 = [ "<Super><Control>3" ];
      switch-to-application-4 = [ "<Super><Control>4" ];
      switch-to-application-5 = [ "<Super><Control>5" ];
      switch-to-application-6 = [ "<Super><Control>6" ];
      switch-to-application-7 = [ "<Super><Control>7" ];
      switch-to-application-8 = [ "<Super><Control>8" ];
      switch-to-application-9 = [ "<Super><Control>9" ];
    };
    "org/gnome/desktop/wm/keybindings" = {
      close = [
        "<Alt>F4"
        "<Shift><Super>q"
      ];
      switch-to-workspace-1 = [
        "<Super>Home"
        "<Super>1"
      ];
      /*
        switch-to-workspace-2 = [ "<Super>2" ];
        switch-to-workspace-3 = [ "<Super>3" ];
        switch-to-workspace-4 = [ "<Super>4" ];
        switch-to-workspace-5 = [ "<Super>5" ];
        switch-to-workspace-6 = [ "<Super>6" ];
        switch-to-workspace-7 = [ "<Super>7" ];
        switch-to-workspace-8 = [ "<Super>8" ];
        switch-to-workspace-9 = [ "<Super>9" ];
      */
      move-to-workspace-1 = [
        "<Super><Shift>Home"
        "<Super><Shift>1"
      ];
      move-to-workspace-2 = [ "<Super><Shift>2" ];
      move-to-workspace-3 = [ "<Super><Shift>3" ];
      move-to-workspace-4 = [ "<Super><Shift>4" ];
      move-to-workspace-5 = [ "<Super><Shift>5" ];
      move-to-workspace-6 = [ "<Super><Shift>6" ];
      move-to-workspace-7 = [ "<Super><Shift>7" ];
      move-to-workspace-8 = [ "<Super><Shift>8" ];
      move-to-workspace-9 = [ "<Super><Shift>9" ];
    };
    "org/gnome/shell/window-switcher" = {
      current-workspace-only = true;
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:close"; # "appmenu:minimize,maximize,close";
      #titlebar-font = "Fira Sans 11";
    };
    "org/gnome/desktop/interface" = {
      accent-color = "purple";
      clock-show-date = true;
      clock-show-seconds = true;
      clock-show-weekday = true;
      show-battery-percentage = true;
      #font-name = "Fira Sans 11";
      #document-font-name = "Fira Sans 11";
      #monospace-font-name = "FiraCode Nerd Font Mono 16";
      gtk-theme = "adw-gtk3-dark";
      color-scheme = "prefer-dark";
      #cursor-theme = "phinger-cursors-light";
      #cursor-size = 32;
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
        "librewolf.desktop"
        "chromium-browser.desktop"
        "org.gnome.Ptyxis.desktop"
        "codium.desktop"
        "org.telegram.desktop.desktop"
        "vesktop.desktop"
        "signal.desktop"
        "org.gnome.Fractal.desktop"
        "io.github.alainm23.planify.desktop"
        "dev.geopjr.Tuba.desktop"
        "org.gnome.Nautilus.desktop"
        "gimp.desktop"
        "org.nicotine_plus.Nicotine.desktop"
        "org.gnome.SystemMonitor.desktop"
        "org.gnome.Settings.desktop"
        "org.octave.Octave.desktop"
      ];
      disable-user-extensions = false;
      enabled-extensions = [
        "runcat@kolesnikov.se"
        "appindicatorsupport@rgcjonas.gmail.com"
        "AlphabeticalAppGrid@stuarthayhurst"
        "solaar-extension@sidevesh"
        "caffeine@patapon.info"
        "tailscale-status@maxgallup.github.com"
        # "paperwm@paperwm.github.com"
        "Vitals@CoreCoding.com"
        # "favourites-in-appgrid@harshadgavali.gitlab.org"
        "hotedge@jonathan.jdoda.ca"
        "weatherornot@somepaulo.github.io"
        "status-area-horizontal-spacing@mathematical.coffee.gmail.com"
        # "gsconnect@andyholmes.github.io"
        "space-bar@luchrioh"
        # "dash-to-dock@micxgx.gmail.com"
        # "gtk4-ding@smedius.gitlab.com"
        # "add-to-desktop@tommimon.github.com"
        # "apps-menu@gnome-shell-extensions.gcampax.github.com"
        /*
          "places-menu@gnome-shell-extensions.gcampax.github.com"
          "window-list@gnome-shell-extensions.gcampax.github.com"
        */
      ];
      disabled-extensions = [ ];
    };
    "org/gnome/shell/extensions/paperwm" = {
      horizontal-margin = 1;
      selection-border-radius-top = 1;
      selection-border-size = 1;
      vertical-margin = 1;
      vertical-margin-bottom = 1;
      window-gap = 1;
    };
    "org/gnome/shell/extensions/dash-to-dock" = {
      apply-custom-theme = false;
      background-opacity = 0.90000000000000004;
      custom-theme-shrink = true;
      dash-max-icon-size = 48;
      dock-fixed = true;
      dock-position = "LEFT";
      extend-height = true;
      height-fraction = 0.90000000000000002;
      hot-keys = false;
      icon-size-fixed = true;
      max-alpha = 0.90000000000000004;
      running-indicator-style = "DOTS";
      show-apps-at-top = false;
      show-mounts-network = true;
      transparency-mode = "FIXED";
    };
    "org/gnome/shell/extensions/just-perfection" = {
      activities-button = false;
      dash = false;
      startup-status = 0;
    };
    "org/gnome/shell/extensions/gtk4-ding" = {
      arrangeorder = "NAME";
      keep-arranged = true;
      show-network-volumes = true;
      start-corner = "top-right";
    };
    "org/gnome/shell/extensions/window-list" = {
      display-all-workspaces = true;
      grouping-mode = "auto";
      show-on-all-monitors = true;
    };
    "org/gnome/desktop/app-folders" = {
      #https://github.com/BenJetson/gnome-dash-fix
      #folder-children = [ ];
      folder-children = [
        "accessories"
        "chrome-apps"
        "games"
        "graphics"
        "internet"
        "office"
        "programming"
        "science"
        "sound---video"
        "system-tools"
        "universal-access"
        "wine"
      ];
    };
    "org/gnome/desktop/app-folders/folders/accessories" = {
      name = "Accessories";
      categories = [ "Utility" ];
    };
    "org/gnome/desktop/app-folders/folders/chrome-apps" = {
      name = "Chrome Apps";
      categories = [ "chrome-apps" ];
    };
    "org/gnome/desktop/app-folders/folders/games" = {
      name = "Games";
      categories = [ "Game" ];
    };
    "org/gnome/desktop/app-folders/folders/graphics" = {
      name = "Graphics";
      categories = [ "Graphics" ];
    };
    "org/gnome/desktop/app-folders/folders/internet" = {
      name = "Internet";
      categories = [
        "Network"
        "WebBrowser"
        "Email"
      ];
    };
    "org/gnome/desktop/app-folders/folders/office" = {
      name = "Office";
      categories = [ "Office" ];
    };
    "org/gnome/desktop/app-folders/folders/programming" = {
      name = "Programming";
      categories = [ "Development" ];
    };
    "org/gnome/desktop/app-folders/folders/science" = {
      name = "Science";
      categories = [ "Science" ];
    };
    "org/gnome/desktop/app-folders/folders/sound---video" = {
      name = "Sound & Video";
      categories = [
        "AudioVideo"
        "Audio"
        "Video"
      ];
    };
    "org/gnome/desktop/app-folders/folders/system-tools" = {
      name = "System Tools";
      categories = [
        "System"
        "Settings"
      ];
    };
    "org/gnome/desktop/app-folders/folders/universal-access" = {
      name = "Universal Access";
      categories = [ "Accessibility" ];
    };
    "org/gnome/desktop/app-folders/folders/wine" = {
      name = "Wine";
      categories = [
        "Wine"
        "X-Wine"
        "Wine-Programs-Accessories"
      ];
    };

    # --- ptyxis ---
    "org/gnome/Ptyxis" = {
      default-profile-uuid = "0c67ead72258a94b1fc94e9066e42a09";
      profile-uuids = [ "0c67ead72258a94b1fc94e9066e42a09" ];
    };
    "org/gnome/Ptyxis/Profiles/0c67ead72258a94b1fc94e9066e42a09" = {
      palette = "Gruvbox Dark";
      opacity = 0.8;
    };

    # --- gnome weather ---
    "org/gnome/Weather" =
      let
        inherit (lib.hm.gvariant) mkTuple mkUint32 mkVariant;
      in
      {
        locations = [
          (mkVariant (mkTuple [
            (mkUint32 2)
            (mkVariant (mkTuple [
              "Ponta Grossa"
              ""
              false
              [
                (mkTuple [
                  (-0.43788859696982335)
                  (-0.8754603154512717)
                ])
              ]
              [
                (mkTuple [
                  (0.0)
                  (0.0)
                ])
              ]
            ]))
          ]))
        ];
      };

    # --- gnome flashback stuff --- #

    "org/gnome/gnome-panel/layout" = {
      object-id-list = [
        "menu-bar"
        "clock"
        "notification-area"
        "show-desktop"
        "user-menu"
        "window-list"
        "workspace-switcher"
        "geyes"
        "system-indicators"
      ];
    };
    "org/gnome/gnome-panel/layout/toplevels/bottom-panel".enable-buttons = true;
    "org/gnome/gnome-panel/layout/toplevels/top-panel".enable-buttons = true;
    "org/gnome/gnome-panel/layout/objects/geyes" = {
      pack-index = 4;
      pack-type = "end";
      toplevel-id = "top-panel";
    };
    "org/gnome/gnome-panel/layout/objects/system-indicators" = {
      pack-index = 2;
      pack-type = "end";
      toplevel-id = "top-panel";
    };
    "org/gnome/gnome-panel/layout/objects/window-list/instance-config" = {
      display-all-workspaces = true;
      group-windows = "auto-group";
      move-unminimized-windows = false;
    };
  };
}
