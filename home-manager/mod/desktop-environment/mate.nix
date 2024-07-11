{ config, inputs, pkgs, ... }:
let
  autostartString = (val: extra: ''
      [Desktop Entry]
      Type=Application
      Exec=${val}
      Hidden=false
      Name=${val}
      ${extra}
      X-MATE-Autostart-Delay=2
  ''); 

  appletDconf = (val: extra: {
    locked = true;
    launcher-location = "${val}.desktop";
    object-type = "launcher";
    panel-right-stick = false;
    position = extra;
    toplevel-id = "top";
  });
in
  {
    home.packages = with pkgs; [
      dconf-editor
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
      (callPackage ./mate/ambient-mate.nix {})
      ubuntu-themes

      kdePackages.oxygen
      kdePackages.oxygen.qt5
      kdePackages.oxygen-sounds
      kdePackages.oxygen-icons

      kdePackages.kdeconnect-kde

      xclip

      volctl

      xscreensaver
      flameshot

      inputs.bing-mate.defaultPackage.x86_64-linux
    ];

    qt = {
      enable = true;
      platformTheme.name = "gtk2";
    };

    dconf.settings = {
      "org/mate/panel/menubar" = {
        show-icon = true;
        icon-name = "nix-snowflake-white";
      };
      /*"org/mate/desktop/background" = {
        #picture-filename = config.stylix.image;
        #picture-options = "wallpaper";
        };*/
        "org/mate/desktop/interface" = with config.stylix.fonts; {
          gtk-theme = "Ambiant-MATE";#"adw-gtk3";
          icon-theme = "Ambiant-MATE";
          font-name = "${sansSerif.name} ${toString (sizes.applications - 1)}";
          document-font-name = "${serif.name}  ${toString (sizes.applications - 1)}";
          monospace-font-name = "${monospace.name} ${toString sizes.applications}";
        };
        "org/mate/marco/general" = {
          button-layout = "close,minimize,maximize:menu";
          theme = "Ambiant-MATE";
          titlebar-uses-system-font = false;
          titlebar-font = "Ubuntu Bold 10";
        };
        "org/gnome/desktop/wm/preferences" = {
          button-layout = "close,minimize,maximize:appmenu";
        };
        "org/mate/desktop/peripherals/mouse".cursor-theme = "Oxygen_Zion";
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
          command-screenshot = "flameshot gui";
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

        "org/mate/desktop/keybindings/custom0" = {
          action = "xscreensaver-command --lock";
          binding = "<Mod4>l";
          name = "xscreensaver";
        };

        /* panel */
        "org/mate/panel/general" = {
          "object-id-list" =  [
            "menu-bar" 
            "st0" 
            "floorp" 
            "google-chrome" 
            "evolution" 
            "liferea" 
            "bitwarden"
            "telegram"
            "vesktop"
            "WhatsAppForLinux"
            "feishin"
            "mate-terminal" 
            "octave"
            "st1" 
            "eyes-applet" 
            "st2" 

            "st3" 
            "notification-area" 
            "st4" 
            "ayatana-indicator-full" 

            "show-desktop" 
            "window-list" 
            "sb0"
            "sensors-applet" 
            "sb1" 
            "multi-load" 
            "sb2"
            "trash"
            "sb3"
            "workspace-switcher" 
          ];
        };
        /*"org/mate/panel/objects/clock/prefs" = {
        show-seconds = true;
        };*/
        "org/mate/panel/toplevels/top/background" = {
          image = "${./mate/ubuntu.png}";
          type = "image";
        };
        "org/mate/panel/toplevels/bottom/background" = {
          image = "${./mate/ubuntu.png}";
          type = "image";
        };

        /* --- panel applets --- */
        "org/mate/panel/objects/menu-bar" = {
          locked = true;
          object-type = "menu-bar";
          panel-right-stick = false;
          position = 0;
          toplevel-id = "top";
        };

        "org/mate/panel/objects/st0" = {
          locked = true;
          object-type = "separator";
          panel-right-stick = false;
          position = 1;
          toplevel-id = "top";
        };

        "org/mate/panel/objects/floorp" = appletDconf "floorp" 2;
        "org/mate/panel/objects/google-chrome" = appletDconf "google-chrome" 3;
        "org/mate/panel/objects/evolution" = appletDconf "org.gnome.Evolution" 4;
        "org/mate/panel/objects/liferea" = appletDconf "net.sourceforge.liferea" 5;
        "org/mate/panel/objects/bitwarden" = appletDconf "bitwarden" 6;
        "org/mate/panel/objects/telegram" = appletDconf "org.telegram.desktop" 7;
        "org/mate/panel/objects/vesktop" = appletDconf "vesktop" 8;
        "org/mate/panel/objects/WhatsAppForLinux" = appletDconf "com.github.eneshecan.WhatsAppForLinux" 9;
        "org/mate/panel/objects/feishin" = appletDconf "" 10;
        "org/mate/panel/objects/mate-terminal" = appletDconf "mate-terminal" 11;
        "org/mate/panel/objects/octave" = appletDconf "org.octave.Octave" 12;

        "org/mate/panel/objects/st1" = {
          locked = true;
          object-type = "separator";
          panel-right-stick = false;
          position = 13;
          toplevel-id = "top";
        };

        "org/mate/panel/objects/eyes-applet" = {
          locked = true;
          object-type = "applet";
          applet-iid = "GeyesAppletFactory::GeyesApplet";
          panel-right-stick = false;
          position = 14;
          toplevel-id = "top";
        };
        "org/mate/panel/objects/eyes-applet/prefs".theme-path = "${pkgs.mate.mate-applets}/share/mate-applets/geyes/Tango";

        "org/mate/panel/objects/st2" = {
          locked = true;
          object-type = "separator";
          panel-right-stick = false;
          position = 15;
          toplevel-id = "top";
        };


        "org/mate/panel/objects/st3" = {
          locked = true;
          object-type = "separator";
          panel-right-stick = true;
          position = 3;
          toplevel-id = "top";
        };

        "org/mate/panel/objects/notification-area" = {
          locked = true;
          object-type = "applet";
          applet-iid = "NotificationAreaAppletFactory::NotificationArea";
          panel-right-stick = true;
          position = 2;
          toplevel-id = "top";
        };

        "org/mate/panel/objects/st4" = {
          locked = true;
          object-type = "separator";
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

        "org/mate/panel/objects/sb0" = {
          locked = true;
          object-type = "separator";
          panel-right-stick = true;
          position = 7;
          toplevel-id = "bottom";
        };

        "org/mate/panel/objects/sensors-applet" = {
          locked = true;
          object-type = "applet";
          applet-iid = "SensorsAppletFactory::SensorsApplet";
          panel-right-stick = true;
          position = 6;
          toplevel-id = "bottom";
        };
        "org/mate/panel/objects/sensors-applet/prefs".timeout-delay = 5000;

        "org/mate/panel/objects/sb1" = {
          locked = true;
          object-type = "separator";
          panel-right-stick = true;
          position = 5;
          toplevel-id = "bottom";
        };

        "org/mate/panel/objects/multi-load" = {
          locked = true;
          object-type = "applet";
          applet-iid = "MultiLoadAppletFactory::MultiLoadApplet";
          panel-right-stick = true;
          position = 4;
          toplevel-id = "bottom";
        };
        "org/mate/panel/objects/multi-load/prefs" = {
          speed = 5000;
          view-diskload = true;
          view-loadavg = false;
          view-memload = true;
          view-netload = true;
          view-swapload = true;
        };

        "org/mate/panel/objects/sb2" = {
          locked = true;
          object-type = "separator";
          panel-right-stick = true;
          position = 3;
          toplevel-id = "bottom";
        };

        "org/mate/panel/objects/trash" = {
          locked = true;
          object-type = "applet";
          applet-iid = "TrashAppletFactory::TrashApplet";
          panel-right-stick = true;
          position = 2;
          toplevel-id = "bottom";
        };

        "org/mate/panel/objects/sb3" = {
          locked = true;
          object-type = "separator";
          panel-right-stick = true;
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
        "org/ayatana/indicator/power" = {
          show-percentage = true;
          /*show-time = true;*/
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

        "org/gnome/evolution/shell".use-header-bar = false;
      };

      xdg.configFile = {
        /*
        Hey, rafameou from the past here.
        Hidden means it's on or off, false means on.
        */
        "autostart/gammastep-indicator.desktop".text = autostartString "gammastep-indicator" "OnlyShowIn=MATE;";
        "autostart/trayscale.desktop".text = autostartString "trayscale --hide-window" "";
      #"autostart/volctl.desktop".text = autostartString "volctl" "";
      "autostart/flameshot.desktop".text = autostartString "flameshot" "OnlyShowIn=MATE;";
      "autostart/bing-mate.desktop".text = autostartString "bing-mate" "OnlyShowIn=MATE;";
      "autostart/kdeconnect-indicator.desktop".text = autostartString "kdeconnect-indicator" "OnlyShowIn=MATE;";

      /* we currently have a service for this on gnome.nix */
      #"autostart/wayland-pipewire-idle-inhibit.desktop".text = autostartString "wayland-pipewire-idle-inhibit -b -d 0";
      /* this is unsafe but we can take the risk */
      "autostart/xscreensaver.desktop".text = autostartString "xscreensaver" "OnlyShowIn=MATE;";
      /* Disable mate-screensaver */
      "autostart/mate-screensaver.desktop".text = ''
        [Desktop Entry]
        Type=Application
        Name=Screensaver
        Icon=preferences-desktop-screensaver
        Exec=mate-screensaver
        OnlyShowIn=MATE;
        NoDisplay=true
        X-MATE-Autostart-Phase=Application
        X-MATE-Autostart-Notify=true
        X-MATE-Bugzilla-Bugzilla=MATE
        X-MATE-Bugzilla-Product=mate-screensaver
        X-MATE-Bugzilla-Component=general
        X-MATE-Bugzilla-Version=1.28.0
        Hidden=true
      '';
    };
  }
