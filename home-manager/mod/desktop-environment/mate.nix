{ config, pkgs, ... }:
let
  autostartString = (val: ''
      [Desktop Entry]
      Type=Application
      Exec=${val}
      Hidden=false
      Name=${val}
      X-MATE-Autostart-Delay=2
  ''); 
in
  {
    home.packages = with pkgs; [
      gnome.dconf-editor
      mate.mate-tweak
      mate.mate-icon-theme-faenza
      networkmanagerapplet
      blueman

      arc-theme
      arc-icon-theme
      cinnamon.mint-themes
      mate.mate-icon-theme-faenza
      cinnamon.mint-x-icons
      iconpack-obsidian

      kdePackages.oxygen
      kdePackages.oxygen.qt5
      kdePackages.oxygen-sounds
      kdePackages.oxygen-icons

      xclip

      volctl
    ];

    dconf.settings = {
      "org/mate/panel/menubar" = {
        show-icon = true;
        icon-name = "nix-snowflake";
      };
      "org/mate/desktop/background" = {
        picture-filename = config.stylix.image;
      };
      "org/mate/desktop/interface" = with config.stylix.fonts; {
        gtk-theme = "TraditionalOk";#"adw-gtk3";
        icon-theme = "Obsidian-Aqua-Light";
        font-name = "${sansSerif.name} ${toString (sizes.applications - 1)}";
        document-font-name = "${serif.name}  ${toString (sizes.applications - 1)}";
        monospace-font-name = "${monospace.name} ${toString sizes.applications}";
      };
      "org/mate/marco/general" = {
        theme = "ClearlooksRe";
        titlebar-uses-system-font = false;
      };
      "org/mate/terminal/profiles/default" = with config.lib.stylix.colors.withHashtag; {
        background-color = base00;
        background-darkness = config.stylix.opacity.terminal;
        background-type = "transparent";
        foreground-color = base05;
        palette = "${base00}:${red}:${green}:${yellow}:${blue}:${magenta}:${cyan}:${base05}:${base03}:${bright-red}:${bright-green}:${yellow}:${bright-blue}:${bright-cyan}:${base06}";
        use-theme-colors = false;
        use-system-font = true;
      };
      "org/mate/marco/keybinding-commands" = {
        command-screenshot = "mate-screenshot -ac";
      };
      /* --- shortcuts --- */
      "org/mate/marco/global-keybindings" = {
        panel-run-dialog = "<Mod4>d";
        switch-to-workspace-1 = "<Mod4>1";
        switch-to-workspace-2 = "<Mod4>2";
        switch-to-workspace-3 = "<Mod4>3";
        switch-to-workspace-4 = "<Mod4>4";
        switch-to-workspace-5 = "<Mod4>5";
        switch-to-workspace-6 = "<Mod4>6";
        switch-to-workspace-7 = "<Mod4>7";
        switch-to-workspace-8 = "<Mod4>8";
        switch-to-workspace-9 = "<Mod4>9";
      };
      "org/mate/marco/window-keybindings" = {
        close = "<Shift><Mod4>q";
        maximize = "<Mod4>Up";
        unmaximize = "<Mod4>Down";
        tile-to-side-e = "<Mod4>Right";
        tile-to-side-w = "<Mod4>Left";

        move-to-workspace-1 = "<Mod4><Shift>1";
        move-to-workspace-2 = "<Mod4><Shift>2";
        move-to-workspace-3 = "<Mod4><Shift>3";
        move-to-workspace-4 = "<Mod4><Shift>4";
        move-to-workspace-5 = "<Mod4><Shift>5";
        move-to-workspace-6 = "<Mod4><Shift>6";
        move-to-workspace-7 = "<Mod4><Shift>7";
        move-to-workspace-8 = "<Mod4><Shift>8";
        move-to-workspace-9 = "<Mod4><Shift>9";
      };

      /* panel */
      "org/mate/panel/general" = {
        "object-id-list" =  ["menu-bar" "mate-screenshot" "mate-terminal" "mate-system-monitor" "sensors-applet" "multi-load" "notification-area" "ayatana-indicator-full" "show-desktop" "window-list" "workspace-switcher" ];
      };
      /*"org/mate/panel/objects/clock/prefs" = {
        show-seconds = true;
      };*/
      "org/mate/panel/toplevels/top/background" = {
        /*image = "/home/rafameou/GoogleDrive/Outros/Temas/Ubuntu Panel BG 32.png";*/
        type = "none";#"image";
      };
      "org/mate/panel/toplevels/bottom/background" = {
        /*image = "/home/rafameou/GoogleDrive/Outros/Temas/Ubuntu Panel BG 32.png";*/
        type = "none";#"image";
      };

      /* --- panel applets --- */
      "org/mate/panel/objects/menu-bar" = {
        locked = true;
        object-type = "menu-bar";
        panel-right-stick = false;
        position = 0;
        toplevel-id = "top";
      };

      "org/mate/panel/objects/mate-screenshot" = {
        launcher-location = "mate-screenshot.desktop";
        object-type = "launcher";
        panel-right-stick = false;
        position = 1;
        toplevel-id = "top";
      };

      "org/mate/panel/objects/mate-terminal" = {
        launcher-location = "mate-terminal.desktop";
        object-type = "launcher";
        panel-right-stick = false;
        position = 2;
        toplevel-id = "top";
      };

      "org/mate/panel/objects/mate-system-monitor" = {
        launcher-location = "mate-system-monitor.desktop";
        object-type = "launcher";
        panel-right-stick = false;
        position = 3;
        toplevel-id = "top";
      };

      "org/mate/panel/objects/sensors-applet" = {
        locked = true;
        object-type = "applet";
        applet-iid = "SensorsAppletFactory::SensorsApplet";
        panel-right-stick = true;
        position = 3;
        toplevel-id = "top";
      };
      "org/mate/panel/objects/sensors-applet/prefs".timeout-delay = 5000;

      "org/mate/panel/objects/multi-load" = {
        locked = true;
        object-type = "applet";
        applet-iid = "MultiLoadAppletFactory::MultiLoadApplet";
        panel-right-stick = true;
        position = 2;
        toplevel-id = "top";
      };
      "org/mate/panel/objects/multi-load/prefs" = {
        speed = 5000;
        view-diskload = true;
        view-loadavg = false;
        view-memload = true;
        view-netload = true;
        view-swapload = true;
      };

      "org/mate/panel/objects/notification-area" = {
        locked = true;
        object-type = "applet";
        applet-iid = "NotificationAreaAppletFactory::NotificationArea";
        panel-right-stick = true;
        position = 1;
        toplevel-id = "top";
      };

      "org/mate/panel/objects/ayatana-indicator-full" = {
        locked = true;
        object-type = "applet";
        applet-iid = "IndicatorAppletCompleteFactory::IndicatorAppletComplete";
        panel-right-stick = true;
        position = 0;
        toplevel-id = "top";
      };

      "org/mate/panel/objects/show-desktop" = {
        locked = true;
        object-type = "applet";
        applet-iid = "WnckletFactory::ShowDesktopApplet";
        panel-right-stick = false;
        position = 0;
        toplevel-id = "bottom";
      };

      "org/mate/panel/objects/window-list" = {
        locked = true;
        object-type = "applet";
        applet-iid = "WnckletFactory::WindowListApplet";
        panel-right-stick = false;
        position = 1;
        toplevel-id = "bottom";
      };

      "org/mate/panel/objects/workspace-switcher" = {
        locked = true;
        object-type = "applet";
        applet-iid = "WnckletFactory::WorkspaceSwitcherApplet";
        panel-right-stick = true;
        position = 0;
        toplevel-id = "bottom";
      };

      /* ayatana */
      "org/ayatana/indicator/datetime" = {
        show-seconds = true;
        show-date = true;
        show-day = true;
      };

      /* --- fix for volume icon disappearing --- (doesnt work -.-) */
      /*"org/mate/settings-daemon/plugins/media-keys" = {
      active = true;
      enable-osd = true;
      volume-step = 5;
      volume-down = "XF86AudioLowerVolume";
      volume-up = "XF86AudioRaiseVolume";
      };*/

      /* --- other --- */
      "apps/volctl" = {
        mixer-command = "pavucontrol";
        mouse-wheel-step = 5;
        osd-position = "bottom-center";
        show-percentage = true;
      };
    };

    xdg.configFile = {
      /*
      Hey, rafameou from the past here.
      Hidden means it's on or off, false means on.
      */
      "autostart/gammastep-indicator.desktop".text = autostartString "gammastep-indicator";
      "autostart/trayscale.desktop".text = autostartString "trayscale --hide-window";
      #"autostart/volctl.desktop".text = autostartString "volctl";
      "autostart/liferea.desktop".text = autostartString "liferea";
  };
}
