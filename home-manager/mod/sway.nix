 {configs, pkgs, lib, ...}:
 { 
  home.packages = with pkgs; [
    brightnessctl
    playerctl
    foot
    networkmanagerapplet
    killall

    #swayfx
    swaybg
    swaylock
    cliphist
    wl-clipboard
    grim
    slurp
    wf-recorder
    #wofi
    fuzzel

    #dolphin
    ark 
    #gwenview

    imv

    lxqt.pcmanfm-qt
    #lxqt.lximage-qt
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
  ];

  home.pointerCursor = {
    name = "phinger-cursors";
    package = pkgs.phinger-cursors;
    #size = 16;
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
      #size = 12;
    };
    theme = {
      name = "Vertex-Dark";
      package = pkgs.theme-vertex;
    };
    iconTheme = {
      name = "Oxygen";
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

  home.sessionVariables.GTK_THEME = "Vertex-Dark";

  programs.bash = {
    enable = true;
    profileExtra = ''
      export PATH="$HOME/.local/bin:$PATH" ;
      if [ "$(tty)" = "/dev/tty1" ]; then
        export SDL_VIDEODRIVER=wayland ;
        export QT_QPA_PLATFORM=wayland ;
        export QT_QPA_PLATFORMTHEME=qt5ct ; 
        export QT_STYLE_OVERRIDE=kvantum ;
        export QT_WAYLAND_DISABLE_WINDOWDECORATION="1" ;
        export _JAVA_AWT_WM_NONREPARENTING=1 ;
        export MOZ_ENABLE_WAYLAND=1 ;
        export CLUTTER_BACKEND="wayland" ; 
        export XDG_SESSION_TYPE="wayland" ;

        # https://github.com/swaywm/sway/wiki#gtk-applications-take-20-seconds-to-start
        dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK ; 
        exec sway --unsupported-gpu ;
      fi
    '';
  };

  #services.udisks2.enable = true;

  #services.playerctld.enable = true;

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
    package = pkgs.swayfx;
    config = rec {
      modifier = "Mod4";
      #menu = "${pkgs.wofi}/bin/wofi --show=drun --insensitive --allow-images --hide-scroll | ${pkgs.findutils}/bin/xargs swaymsg exec --";
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
      #workspaceAutoBackAndForth = true;
      #workspaceLayout = "default";
      /*gaps = rec {
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
        {command = "--no-startup-id nm-applet --indicator";}
        {command = "--no-startup-id ${pkgs.wl-clipboard}/bin/wl-paste --watch ${pkgs.cliphist}/bin/cliphist store"; }
        {command = "--no-startup-id ${pkgs.swaybg}/bin/swaybg -m fill -i ~/back"; }
	{command = "--no-startup-id ${pkgs.udiskie}/bin/udiskie -t"; }
      ];
      keybindings = lib.mkOptionDefault {
        #"XF86AudioPlay"              = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
        #"XF86AudioStop"              = "exec ${pkgs.playerctl}/bin/playerctl stop";
        #"XF86AudioPrev"              = "exec ${pkgs.playerctl}/bin/playerctl previous";
        #"XF86AudioNext"              = "exec ${pkgs.playerctl}/bin/playerctl next";
        #"shift+XF86AudioPrev"        = "exec ${pkgs.playerctl}/bin/playerctl position 10-";
        #"shift+XF86AudioNext"        = "exec ${pkgs.playerctl}/bin/playerctl position 10+";
        #"shift+XF86AudioLowerVolume" = "exec ${pkgs.playerctl}/bin/playerctl volume 0.1-";
        #"shift+XF86AudioRaiseVolume" = "exec ${pkgs.playerctl}/bin/playerctl volume 0.1+";

        #"${alt}+XF86AudioMute" = "exec ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";

        "XF86AudioMute"        = "exec ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "XF86AudioLowerVolume" = "exec ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        "XF86AudioRaiseVolume" = "exec ${pkgs.wireplumber}/bin/wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+";

        "XF86MonBrightnessUp"   = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 10%+";
        "XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 10%-";

        "Print"          = "exec ${pkgs.slurp}/bin/slurp | ${pkgs.grim}/bin/grim -g - - | ${pkgs.wl-clipboard}/bin/wl-copy";
	"${modifier}+l"  = "exec --no-startup-id ${pkgs.swaylock}/bin/swaylock -Ffk -c 000000";
      };
    };
    #extraSessionCommands = ''
    extraConfig = ''
      blur enable
      blur_xray disable
      shadows enable
      corner_radius 10
      layer_effects "waybar" blur enable; shadows enable
      layer_effects "launcher" blur enable; shadows enable; corner_radius 15
    '';

    systemd.enable = true;
    wrapperFeatures.gtk = true;
    xwayland = true;
  };

  programs.foot = {
    enable = true;
    settings = {
      colors = {
        background=000000;
        alpha = 0.75;
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
        background = "0000007d";#e6";
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

  # https://github.com/rafaelrc7/dotfiles/blob/master/users/rafael/waybar.nix

  programs.waybar = {
    enable = true;
    settings = [{
      layer = "bottom";
      position = "bottom";
      height = 25;
      spacing = 5;

      modules-left   = [ "sway/workspaces" "sway/mode" "sway/scratchpad" "custom/media" "sway/window"];
      #modules-center = [ "sway/window" ];
      modules-right  = [ "tray" "idle_inhibitor" "pulseaudio" "network" "cpu" "memory" "temperature" "backlight" "keyboard-state" "sway/language" "battery" "battery#bat2" "clock" ];

      "sway/workspaces" = {
        all-outputs = true;
        format = "{name}{icon}";
        format-icons = {
          "urgent" = " ";
          "focused" = "";
          "default" = "";
        };
      };

      /*"sway/window" = {
	icon = true;
	icon-size = 16;
      };*/

      keyboard-state = {
        numlock = true;
        capslhock = true;
        format = "{name}{icon}";
        format-icons = {
          locked = "";
          unlocked = "";
        };
      };

      "sway/scratchpad" = {
          format = "{icon} {count}";
          show-empty = false;
          format-icons = ["" ""];
          tooltip = true;
          tooltip-format = "{app}: {title}";
      };

      idle_inhibitor = {
          format = "{icon}";
          format-icons = {
              "activated" = "";
              "deactivated" = "";
          };
      };

      tray = {
          # icon-size = 21;
          spacing = 10;
      };

      clock = {
          timezone = lib.mkDefault "America/Sao_Paulo";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format = "{:%T %d/%m/%Y}";
          interval = 1;
      };

      cpu = {
          format = "{usage}% ";
          tooltip = false;
      };

      memory = {
          format = "{}% ";
      };

      temperature = {
          # "thermal-zone" = 2;
          # "hwmon-path" = "/sys/class/hwmon/hwmon2/temp1_input";
          critical-threshold = 80;
          # "format-critical" = "{temperatureC}°C {icon}";
          format = "{temperatureC}°C {icon}";
          format-icons = ["" "" ""];
      };

      backlight = {
          # "device" = "acpi_video1";
          format = "{percent}% {icon}";
          format-icons = ["" "" "" "" "" "" "" "" ""];
      };

      battery = {
          states = {
              good = 95;
              warning = 30;
              critical = 15;
          };
          format = "{capacity}% {icon} ";
          format-charging = "{capacity}%  ";
          format-plugged = "{capacity}%  ";
          format-alt = "{time} {icon} ";
          format-icons = ["" "" "" "" ""];
      };

      "battery#bat2" = {
          bat = "BAT2";
      };


      network = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "";
          tooltip-format = "{ifname} via {gwaddr} at {ipaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
      };

      pulseaudio = {
          scroll-step = 1;
          format = "{volume}% {icon}  {format_source}";
          format-bluetooth = "{volume}% {icon}  {format_source}";
          format-bluetooth-muted = " {icon}  {format_source}";
          format-muted = "   {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = ["" "" ""];
          };
          on-click = "pavucontrol-qt";
      };
    }];

    style = ''
      * {
          /* `otf-font-awesome` is required to be installed for icons */
          font-family: Inter, "Font Awesome 6 Free";
          font-size: 12px;
          border-radius: 5px;
      }

      window#waybar {
          /*background-color: rgba(43, 48, 59, 0.5);*/
	  background: linear-gradient(180deg, rgba(70,70,70,0.75) 0%, rgba(0,0,0,0.75) 100%);
          /*border-bottom: 3px solid rgba(100, 114, 125, 0.5);*/
	  /*border-bottom: 3px solid rgba(0,0,0,0.9);
	  border-top: 1px solid rgba(0,0,0,1);*/
          color: #ffffff;
          transition-property: background-color;
          transition-duration: .5s;
          border-radius: 0px;
      }

      window#waybar.hidden {
          opacity: 0.2;
      }

      /*
      window#waybar.empty {
          background-color: transparent;
      }
      window#waybar.solo {
          background-color: #FFFFFF;
      }
      */

      window#waybar.termite {
          background-color: #3F3F3F;
      }

      window#waybar.chromium {
          background-color: #000000;
          border: none;
      }

      button {
          /* Use box-shadow instead of border so the text isn't offset */
          box-shadow: inset 0 -3px transparent;
          /* Avoid rounded borders under each button name */
          border: none;
          border-radius: 0;
      }

      /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
      button:hover {
          background: inherit;
          /*box-shadow: inset 0 -3px #ffffff;*/
      }

      #workspaces button {
          padding: 0 5px;
          background-color: transparent;
          color: #ffffff;
	  border-radius: 0%;
      }

      #workspaces button:hover {
          /*background: rgba(0, 0, 0, 0.2);*/
	  /*background: linear-gradient(180deg, rgba(100,114,125,0.9) 0%, rgba(0,0,0,0.9) 100%);*/
	  background: radial-gradient(circle, rgba(150,150,150,1) 0%, rgba(0,0,0,0) 100%);
      }

      #workspaces button.focused {
          /*background-color: #64727D;*/
          /*box-shadow: inset 0 -3px #ffffff;*/
	  background: radial-gradient(circle, rgba(255,255,255,1) 0%, rgba(0,0,0,0) 100%);
	  color: #000000;
      }

      #workspaces button.urgent {
          /*background-color: #eb4d4b;*/
	  /*background: linear-gradient(0deg, rgba(0,0,0,1) 0%, rgba(235,77,75,1) 100%);*/
	  background: radial-gradient(circle, rgba(231,77,75,1) 0%, rgba(0,0,0,0) 100%);

      }

      #mode {
          background-color: #64727D;
          border-bottom: 3px solid #ffffff;
      }

      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #backlight,
      #network,
      #pulseaudio,
      #wireplumber,
      #custom-media,
      #tray,
      #mode,
      #idle_inhibitor,
      #scratchpad,
      #mpd {
          padding: 0 10px;
          color: #ffffff;
      }

      #window,
      #workspaces {
          margin: 0 4px;
      }

      #window {
	padding: 0 5px;
	/*background: linear-gradient(180deg, rgba(255,255,255,0.5) 0%, rgba(120,120,120,0.5) 100%);*/
        border: 1px solid rgba(125,125,125,0.75);	
	background: radial-gradient(circle, rgba(70,70,70,0.5) 0%, rgba(0,0,0,0.5) 100%);
	color: #ffffff;
      }

      #waybar.empty #window {
        border: none;
	background: none;
      }

      /* If workspaces is the leftmost module, omit left margin */
      .modules-left > widget:first-child > #workspaces {
          margin-left: 0;
      }

      /* If workspaces is the rightmost module, omit right margin */
      .modules-right > widget:last-child > #workspaces {
          margin-right: 0;
      }

      #clock {
          /*background-color: #64727D;*/
	      background: linear-gradient(0deg, rgba(0,0,0,1) 0%, rgba(100,114,125,1) 100%);
      }

      #battery {
          /*background-color: #ffffff;*/
          background: linear-gradient(180deg, rgba(255,255,255,1) 0%, rgba(162,162,162,1) 100%);
          color: #000000;
      }

      #battery.charging, #battery.plugged {
          color: #ffffff;
          /*background-color: #26A65B;*/
          background: linear-gradient(0deg, rgba(0,0,0,1) 0%, rgba(38,166,91,1) 100%);
      }

      @keyframes blink {
          to {
              background-color: #ffffff;
              color: #000000;
          }
      }

      #battery.critical:not(.charging) {
          background-color: #f53c3c;
          color: #ffffff;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
      }

      label:focus {
          background-color: #000000;
      }

      #cpu {
          /* background-color: #2ecc71;
          color: #000000; */
          background: linear-gradient(0deg, rgba(0,0,0,1) 0%, rgba(46,204,113,1) 100%);
      }

      #memory {
          /* background-color: #9b59b6; */
          background: linear-gradient(0deg, rgba(0,0,0,1) 0%, rgba(155,89,182,1) 100%);
      }

      #disk {
          /* background-color: #964B00; */
          background: linear-gradient(0deg, rgba(0,0,0,1) 0%, rgba(150,75,0,1) 100%);
      }

      #backlight {
          /* background-color: #90b1b1; */
          background: linear-gradient(0deg, rgba(0,0,0,1) 0%, rgba(144,177,177,1) 100%);
      }

      #network {
          /* background-color: #2980b9; */
          background: linear-gradient(0deg, rgba(0,0,0,1) 0%, rgba(41,128,185,1) 100%);
      }

      #network.disconnected {
          /* background-color: #f53c3c; */
          background: linear-gradient(0deg, rgba(0,0,0,1) 0%, rgba(245,60,60,1) 100%);
      }

      #pulseaudio {
          /* background-color: #f1c40f; */
          background: linear-gradient(180deg, rgba(255,255,255,1) 0%, rgba(241,196,15,1) 100%);
          color: #000000;
      }

      #pulseaudio.muted {
          /* background-color: #90b1b1; */
          background: linear-gradient(180deg, rgba(255,255,255,1) 0%, rgba(144,177,177,1) 100%);
          color: #2a5c45;
      }

      #wireplumber {
          background-color: #fff0f5;
          color: #000000;
      }

      #wireplumber.muted {
          background-color: #f53c3c;
      }

      #custom-media {
          background-color: #66cc99;
          color: #2a5c45;
          min-width: 100px;
      }

      #custom-media.custom-spotify {
          background-color: #66cc99;
      }

      #custom-media.custom-vlc {
          background-color: #ffa000;
      }

      #temperature {
          /*background-color: #f0932b;*/
          background: linear-gradient(0deg, rgba(0,0,0,1) 0%, rgba(240,147,43,1) 100%);
      }

      #temperature.critical {
          /*background-color: #eb4d4b;*/
          background: linear-gradient(0deg, rgba(0,0,0,1) 0%, rgba(235,77,75,1) 100%);
      }

      #tray {
          /*background-color: #2980b9;*/
          background: linear-gradient(0deg, rgba(2,0,36,1) 0%, rgba(41,128,185,1) 100%);
      }

      #tray > .passive {
          -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
          -gtk-icon-effect: highlight;
          background-color: #eb4d4b;
      }

      #idle_inhibitor {
          /* background-color: #2d3436; */
          background: linear-gradient(0deg, rgba(0,0,0,1) 0%, rgba(45,52,54,1) 100%);
      }

      #idle_inhibitor.activated {
          /* background-color: #ecf0f1; */
          background: linear-gradient(0deg, rgba(255,255,255,1) 0%, rgba(236,240,241,1) 100%);
          color: #2d3436;
      }

      #language {
          /*background: #00b093;
          color: #740864;*/
          padding: 0 5px;
          margin: 0 5px;
          min-width: 16px;
          background: linear-gradient(0deg, rgba(0,0,0,1) 0%, rgba(0,176,147,1) 100%);
      }

      #keyboard-state {
          background: #97e1ad;
          color: #000000;
          padding: 0 0px;
          margin: 0 5px;
          min-width: 16px;
      }

      #keyboard-state > label {
          padding: 0 5px;
      }

      #keyboard-state > label.locked {
          background: rgba(0, 0, 0, 0.2);
      }

      #scratchpad {
          background: rgba(0, 0, 0, 0.2);
      }

      #scratchpad.empty {
        background-color: transparent;
      }
    '';
  };
 }
