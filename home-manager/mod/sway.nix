{configs, pkgs, lib, ...}:
{
  imports = [
    ./waybar.nix
  ];
  home.packages = with pkgs; [
    brightnessctl
    playerctl
    foot
    networkmanagerapplet
    killall

    swaybg
    swaylock
    cliphist
    wl-clipboard
    grim
    slurp
    wf-recorder
    fuzzel

    ark 
    imv
    lxqt.pcmanfm-qt
    lxqt.pavucontrol-qt
    lxqt.qps

    selectdefaultapplication

    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5.qtwayland
    qt6Packages.qtstyleplugin-kvantum
    qt6.qtwayland
    qt6Packages.qt6ct

    libsForQt5.oxygen
    libsForQt5.oxygen-sounds
    libsForQt5.oxygen-icons5

    gnome.adwaita-icon-theme
    hicolor-icon-theme

    udiskie
    android-file-transfer

    breeze-icons

    /*(catppuccin-kvantum.override {
    accent = "Sky";
    variant = "Frappe";
    })*/
    (catppuccin.override {
      accent = "green";
      variant = "frappe";
      themeList = ["kvantum"];
    })
  ];

  home.pointerCursor = {
    name = "phinger-cursors";
    package = pkgs.phinger-cursors;
    /*size = 16;*/
    x11.enable = true;
    gtk.enable = true;
  };

  qt = {
    enable = true;
    platformTheme = "qtct";
  };

  gtk = {
    enable = true;
    font = {
      name = "Inter";
      /*size = 12;*/
    };
    theme = {
      /*name = "Vertex-Dark";
      package = pkgs.theme-vertex;*/
      name = "Catppuccin-Frappe-Compact-Green-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "green" ];
        size = "compact";
        tweaks = [ "rimless" ];
        variant = "frappe";
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        accent = "green";
        flavor = "frappe";
      };
    };
    cursorTheme = {
      name = "phinger-cursors";
      package = pkgs.phinger-cursors;
    };

    gtk2.extraConfig = ''
      gtk-enable-animations=1
      gtk-primary-button-warps-slider=0
      gtk-toolbar-style=3
      gtk-menu-images=1
      gtk-button-images=1
    '';

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-decoration-layout = "icon:minimize,maximize,close";
      gtk-enable-animations = true;
      gtk-menu-images = true;
      gtk-modules = "colorreload-gtk-module:window-decorations-gtk-module";
      gtk-primary-button-warps-slider = false;
      gtk-toolbar-style = 3;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-decoration-layout = "icon:minimize,maximize,close";
      gtk-enable-animations = true;
      gtk-primary-button-warps-slider = false;
    };
  };

  /*home.sessionVariables.GTK_THEME = "Vertex-Dark";*/

  programs.bash = {
    enable = true;
    profileExtra = ''
      export PATH="$HOME/.local/bin:$PATH" ;
      if [ "$(tty)" = "/dev/tty1" ]; then
      export SDL_VIDEODRIVER=wayland ;
      export QT_QPA_PLATFORM=wayland ;
      export QT_QPA_PLATFORMTHEME=qt5ct ; 
      # export QT_STYLE_OVERRIDE=kvantum ;
      # export GTK_THEME="Catppuccin-Frappe-Compact-Green-Dark" ;
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1" ;
      export _JAVA_AWT_WM_NONREPARENTING=1 ;
      export MOZ_ENABLE_WAYLAND=1 ;
      export CLUTTER_BACKEND="wayland" ; 
                  export XDG_SESSION_TYPE="wayland" ;

# https://github.com/swaywm/sway/wiki#gtk-applications-take-20-seconds-to-start
                  # dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK ; 
                  exec sway --unsupported-gpu ;
                  fi
    '';
  };

  /*services.udisks2.enable = true; services.playerctld.enable = true;*/

  services.swayidle = {
    enable = true;
    systemdTarget = "sway-session.target";
    timeouts = [
      { timeout = 300; command = "${pkgs.swaylock}/bin/swaylock -Ffk -c 000000"; }
      { timeout = 600; command = "${pkgs.sway}/bin/swaymsg \"output * power off\"";
      resumeCommand = "${pkgs.sway}/bin/swaymsg \"output * power on\""; }
    ];
    events = [
      { event = "before-sleep"; command = "${pkgs.swaylock}/bin/swaylock -Ffk -c 000000"; }
    ];
  };

  services.mako = {
    enable = true;
    actions = true;
    anchor = "top-right";
    icons = true;
    defaultTimeout = 7000; # 7s
    ignoreTimeout = true;
  };

  services.gammastep = {
    enable = true;
    provider = "geoclue2";
    tray = true;
    settings.general = {
      fade = "1";
      adjustment-method = "wayland";
    };
    temperature = {
      day   = 5500;
      night = 2700;
    };
  };

  wayland.windowManager.sway = {
    enable = true;
    /*package = pkgs.swayfx;*/
    config = rec {
      modifier = "Mod4";
      /*menu = "${pkgs.wofi}/bin/wofi --show=drun --insensitive --allow-images --hide-scroll | ${pkgs.findutils}/bin/xargs swaymsg exec --";*/
      menu = "${pkgs.fuzzel}/bin/fuzzel | ${pkgs.findutils}/bin/xargs swaymsg exec --";
      bars = [{ command = "${pkgs.waybar}/bin/waybar"; }];
      terminal = "foot"; 
      input = {
        "type:keyboard" = {
          xkb_layout = "br,br";
          xkb_model = "abnt2,abnt2";
          xkb_variant = ",thinkpad";
          xkb_numlock = "enabled,disabled";
          xkb_options = "grp:alt_shift_toggle";
        };
      };
      focus = {
        followMouse = true;
        wrapping = "no";
        mouseWarping = true;
        newWindow = "smart";
      };
      /*workspaceAutoBackAndForth = true;
      workspaceLayout = "default";
      gaps = rec {
      smartBorders = "on";
      smartGaps = true;
      inner = 4;
      outer = -inner;
      };*/
      floating = {
        border = 2;
        titlebar = true; #doesnt work
      };
      window = {
        border = 2;
        titlebar = false;
        hideEdgeBorders = "smart";
        commands = [ ];
      };
      startup = [
        {command = "--no-startup-id dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK";}
        {command = "--no-startup-id nm-applet --indicator";}
        {command = "--no-startup-id ${pkgs.wl-clipboard}/bin/wl-paste --watch ${pkgs.cliphist}/bin/cliphist store"; }
        {command = "--no-startup-id ${pkgs.swaybg}/bin/swaybg -m tile -i ~/back"; } #fill
        {command = "--no-startup-id ${pkgs.udiskie}/bin/udiskie -t"; }
      ];
      keybindings = lib.mkOptionDefault {
        /*"XF86AudioPlay"              = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
        "XF86AudioStop"              = "exec ${pkgs.playerctl}/bin/playerctl stop";
        "XF86AudioPrev"              = "exec ${pkgs.playerctl}/bin/playerctl previous";
        "XF86AudioNext"              = "exec ${pkgs.playerctl}/bin/playerctl next";
        "shift+XF86AudioPrev"        = "exec ${pkgs.playerctl}/bin/playerctl position 10-";
        "shift+XF86AudioNext"        = "exec ${pkgs.playerctl}/bin/playerctl position 10+";
        "shift+XF86AudioLowerVolume" = "exec ${pkgs.playerctl}/bin/playerctl volume 0.1-";
        "shift+XF86AudioRaiseVolume" = "exec ${pkgs.playerctl}/bin/playerctl volume 0.1+";

        "${alt}+XF86AudioMute" = "exec ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";*/

        "XF86AudioMute"        = "exec ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "XF86AudioLowerVolume" = "exec ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        "XF86AudioRaiseVolume" = "exec ${pkgs.wireplumber}/bin/wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+";

        "XF86MonBrightnessUp"   = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 10%+";
        "XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 10%-";

        "Print"          = "exec ${pkgs.slurp}/bin/slurp | ${pkgs.grim}/bin/grim -g - - | ${pkgs.wl-clipboard}/bin/wl-copy";
        "${modifier}+l"  = "exec --no-startup-id ${pkgs.swaylock}/bin/swaylock -Ffk -c 000000";
      };
    };
    /*extraSessionCommands = ''*/
    /*extraConfig = ''
      blur enable
      blur_xray disable
      shadows enable
      corner_radius 10
      layer_effects "waybar" blur enable; shadows enable
      layer_effects "launcher" blur enable; shadows enable; corner_radius 15
    '';*/

    systemd.enable = true;
    wrapperFeatures.gtk = true;
    xwayland = true;
  };

  programs.foot = {
    enable = true;
    settings = {
      /*colors = {
      background=000000;
      alpha = 0.75;
      };*/
      /*https://github.com/catppuccin/foot/blob/main/catppuccin-frappe.conf*/
      colors = {
        /*dark*/
        foreground="c6d0f5"; # Text
        background="303446"; # Base
        regular0="51576d";   # Surface 1
        regular1="e78284";   # red
        regular2="a6d189";   # green
        regular3="e5c890";   # yellow
        regular4="8caaee";   # blue
        regular5="f4b8e4";   # pink
        regular6="81c8be";   # teal
        regular7="b5bfe2";   # Subtext 1
        bright0="626880";    # Surface 2
        bright1="e78284";    # red
        bright2="a6d189";    # green
        bright3="e5c890";   # yellow
        bright4="8caaee";    # blue
        bright5="f4b8e4";    # pink
        bright6="81c8be";    # teal
        bright7="a5adce";    # Subtext 0
        /*white*/
        /*
        foreground="4c4f69"; # Text
        background="eff1f5"; # Base
        regular0="5c5f77";   # Subtext 1
        regular1="d20f39";   # red
        regular2="40a02b";   # green
        regular3="df8e1d";   # yellow
        regular4="1e66f5";   # blue
        regular5="ea76cb";   # pink
        regular6="179299";   # teal
        regular7="acb0be";   # Surface 2
        bright0="6c6f85";   # Subtext 0
        bright1="d20f39";    # red
        bright2="40a02b";    # green
        bright3="df8e1d";    # yellow
        bright4="1e66f5";    # blue
        bright5="ea76cb";    # pink
        bright6="179299";    # teal
        bright7="bcc0cc";    # Surface 1
        */
        /*alpha = 0.75;*/
      };
    };
  };

  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        icon-theme = "hicolor";
        font = "Inter";
      };
      colors = {
        background = "303446ff";#7d";#e6";
        text = "ffffffff";
        selection = "464646ff";
        selection-text = "ffffffff";
        border = "ffffff00";
      };
      border = {
        width = 1;
        radius = 0;
      };
    };
  };
}
