{ lib, config, pkgs, ... }:
{
  imports = [
    ./waybar.nix
    #inputs.wayland-pipewire-idle-inhibit.homeModules.default
  ];
  home.packages = with pkgs; [
    brightnessctl
    playerctl

    swaybg
    /*swww*/
    swaylock
    cliphist
    wl-clipboard
    grim
    slurp
    wf-recorder
    fuzzel

    wayland-pipewire-idle-inhibit
  ];

  services = {
    swayidle = {
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
    /*wayland-pipewire-idle-inhibit = {
      enable = true;
      systemdTarget = "sway-session.target";
    };*/
  };

  wayland.windowManager.sway = {
    enable = true;
    #package = pkgs.swayfx;
    config = rec {
      modifier = "Mod4";
      fonts = {
        names = ["Fira Sans"];
        style = "Regular";
        size = 10.0;
      }; 
      /*colors stolen from https://github.com/Haze-sh/base16-bemenu/"*/
      menu = ''BEMENU_OPTS="--tb '#${config.colorScheme.palette.base03}' --tf '#${config.colorScheme.palette.base06}' --fb '#${config.colorScheme.palette.base00}' --ff '#${config.colorScheme.palette.base06}' --nb '#${config.colorScheme.palette.base00}' --nf '#${config.colorScheme.palette.base04}' --hb '#${config.colorScheme.palette.base02}' --hf '#${config.colorScheme.palette.base0A}' --sb '#${config.colorScheme.palette.base02}' --sf '#${config.colorScheme.palette.base0A}' --scb '#${config.colorScheme.palette.base00}' --scf '#${config.colorScheme.palette.base0E}'" ${pkgs.nixpkgs-stable.j4-dmenu-desktop}/bin/j4-dmenu-desktop --dmenu="${pkgs.bemenu}/bin/bemenu -i -l 10"''; 
      /*menu = "${pkgs.fuzzel}/bin/fuzzel | ${pkgs.findutils}/bin/xargs swaymsg exec --";*/
      /*bars = [{ command = "${pkgs.waybar}/bin/waybar"; }];*/
      bars = [
        {
          fonts = {
            names = ["Fira Sans"];
            style = "Regular";
            size = 10.0;
          };
          trayOutput = "none";
          position = "bottom";
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-bottom.toml";
          /*---------------------------------------------------------|
          | Stolen from https://github.com/tinted-theming/base16-i3/ |
          |---------------------------------------------------------*/
          colors = {
            background = "#${config.colorScheme.palette.base00}";
            separator = "#${config.colorScheme.palette.base01}";
            statusline = "#${config.colorScheme.palette.base04}";
            focusedWorkspace = {
              border = "#${config.colorScheme.palette.base05}";
              background = "#${config.colorScheme.palette.base0D}"; 
              text = "#${config.colorScheme.palette.base00}";
            };
            activeWorkspace = {
              border = "#${config.colorScheme.palette.base05}";
              background = "#${config.colorScheme.palette.base03}";  
              text = "#${config.colorScheme.palette.base00}";
            };
            inactiveWorkspace = {
              border = "#${config.colorScheme.palette.base03}";
              background = "#${config.colorScheme.palette.base01}";
              text = "#${config.colorScheme.palette.base05}";
            };
            urgentWorkspace = {
              border = "#${config.colorScheme.palette.base08}";
              background = "#${config.colorScheme.palette.base08}";
              text = "#${config.colorScheme.palette.base00}";
            };
            bindingMode = {
              border = "#${config.colorScheme.palette.base00}";
              background = "#${config.colorScheme.palette.base0A}";
              text = "#${config.colorScheme.palette.base00}";
            };
          };
        }
      ];
      colors = {
        focused = {
          border = "#${config.colorScheme.palette.base05}";
          background = "#${config.colorScheme.palette.base0D}";
          text = "#${config.colorScheme.palette.base00}";
          indicator = "#${config.colorScheme.palette.base0D}";
          childBorder = "#${config.colorScheme.palette.base0C}";
        };
        focusedInactive = {
          border = "#${config.colorScheme.palette.base01}";
          background = "#${config.colorScheme.palette.base01}";
          text = "#${config.colorScheme.palette.base05}";
          indicator = "#${config.colorScheme.palette.base03}";
          childBorder = "#${config.colorScheme.palette.base01}";
        };
        unfocused = {
          border = "#${config.colorScheme.palette.base01}";
          background = "#${config.colorScheme.palette.base00}";
          text = "#${config.colorScheme.palette.base05}";
          indicator = "#${config.colorScheme.palette.base01}";
          childBorder = "#${config.colorScheme.palette.base01}";
        };
        urgent = {
          border = "#${config.colorScheme.palette.base08}";
          background = "#${config.colorScheme.palette.base08}";
          text = "#${config.colorScheme.palette.base00}";
          indicator = "#${config.colorScheme.palette.base08}";
          childBorder = "#${config.colorScheme.palette.base08}";
        };
        placeholder = {
          border = "#${config.colorScheme.palette.base00}";
          background = "#${config.colorScheme.palette.base00}";
          text = "#${config.colorScheme.palette.base05}";
          indicator = "#${config.colorScheme.palette.base00}";
          childBorder = "#${config.colorScheme.palette.base00}";
        };
        background = "#${config.colorScheme.palette.base07}"; 
      };
      terminal = "foot"; 
      input = {
        "type:keyboard" = {
          xkb_layout = "br";
          xkb_model = "abnt2";
          xkb_variant = "";
          xkb_numlock = "enabled";
          xkb_options = "grp:alt_shift_toggle";
        };
        "type:touchpad" = {
          dwt = "enabled";
          tap = "enabled";
          middle_emulation = "enabled";
        };
      };
      focus = {
        followMouse = true;
        wrapping = "no";
        mouseWarping = true;
        newWindow = "smart";
      };
      /*workspaceAutoBackAndForth = true;
      workspaceLayout = "default";*/
      /*gaps = {
        inner = 10;
      };*/
      floating = {
        border = 1;
        titlebar = true; #doesnt work
      };
      window = {
        border = 1;
        titlebar = false;
        hideEdgeBorders = "smart";
        commands = [ ];
      };
      startup = [
        /* https://github.com/swaywm/sway/wiki#gtk-applications-take-20-seconds-to-start */
        {command = "--no-startup-id dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK";}
        {command = "--no-startup-id nm-applet --indicator";}
        {command = "--no-startup-id ${pkgs.wl-clipboard}/bin/wl-paste --watch ${pkgs.cliphist}/bin/cliphist store"; }
        {command = "--no-startup-id ${pkgs.swaybg}/bin/swaybg -m fill -i /home/rafameou/GoogleDrive/back"; } #fill
        /*{command = "--no-startup-id ${pkgs.swww}/bin/swww init & ${pkgs.swww}/bin/swww img ~/back";}*/
        /*{command = "--no-startup-id ${pkgs.udiskie}/bin/udiskie -t"; }*/
        {command = "--no-startup-id ${pkgs.gammastep}/bin/gammastep -l geoclue2 -m wayland"; }
        {command = "--no-startup-id ${pkgs.wayland-pipewire-idle-inhibit}/bin/wayland-pipewire-idle-inhibit -d 5";}

        {command = "--no-startup-id ${pkgs.kdePackages.kdeconnect-kde}/bin/kdeconnect-indicator";}

        /*mate stuff*/
        /*https://github.com/mate-desktop/mate-wayland-session/blob/master/session/mate-wayland-components.sh#L42*/
        {command = "--no-startup-id caja -n --force-desktop"; } 
        {command = "--no-startup-id mate-panel"; }
        {command = "--no-startup-id polkit-mate-authentication-agent-1"; }
        {command = "--no-startup-id mate-notification-daemon"; } 
      ];
      keybindings = lib.mkOptionDefault {
        /*"XF86AudioPlay"              = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
        "XF86AudioStop"              = "exec ${pkgs.playerctl}/bin/playerctl stop";
        "XF86AudioPrev"              = "exec ${pkgs.playerctl}/bin/playerctl previous";
        "XF86AudioNext"              = "exec ${pkgs.playerctl}/bin/playerctl next";
        "shift+XF86AudioPrev"        = "exec ${pkgs.playerctl}/bin/playerctl position 10-";
        "shift+XF86AudioNext"        = "exec ${pkgs.playerctl}/bin/playerctl position 10+";
        "shift+XF86AudioowerVolume" = "exec ${pkgs.playerctl}/bin/playerctl volume 0.1-";
        "shift+XF86AudioRaiseVolume" = "exec ${pkgs.playerctl}/bin/playerctl volume 0.1+";

        "${alt}+XF86AudioMute" = "exec ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";*/

        /*"${modifier}+minus" = "";*/
        "${modifier}+equal" = "gaps inner current toggle 10";

        "XF86AudioMute"        = "exec ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "XF86AudioLowerVolume" = "exec ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        "XF86AudioRaiseVolume" = "exec ${pkgs.wireplumber}/bin/wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+";
        "XF86AudioMicMute"     = "exec ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";

        "XF86MonBrightnessUp"   = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 10%+";
        "XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 10%-";

        "Print"          = "exec ${pkgs.slurp}/bin/slurp | ${pkgs.grim}/bin/grim -g - - | ${pkgs.wl-clipboard}/bin/wl-copy";
        "${modifier}+l"  = "exec --no-startup-id ${pkgs.swaylock}/bin/swaylock -Ffk -c 000000";
      };
    };
    /*extraSessionCommands = ''*/
    extraConfig = ''
    #blur enable
    #blur_xray disable
      #shadows enable
      #corner_radius 10
      #layer_effects "panel" shadows enable
      #layer_effects "menu" shadows enable;
    '';

    systemd.enable = true;
    wrapperFeatures.gtk = true;
    xwayland = true;
  };

  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "FiraCode Nerd Font Mono:size=12";
      };
      colors = {
        foreground="${config.colorScheme.palette.base05}";
        background="${config.colorScheme.palette.base00}";
        regular0="${config.colorScheme.palette.base00}";
        regular1="${config.colorScheme.palette.base08}";
        regular2="${config.colorScheme.palette.base0B}";
        regular3="${config.colorScheme.palette.base0A}";
        regular4="${config.colorScheme.palette.base0D}";
        regular5="${config.colorScheme.palette.base0E}";
        regular6="${config.colorScheme.palette.base0C}";
        regular7="${config.colorScheme.palette.base05}";
        bright0="${config.colorScheme.palette.base03}";
        bright1="${config.colorScheme.palette.base08}"; 
        bright2="${config.colorScheme.palette.base0B}";
        bright3="${config.colorScheme.palette.base0A}";
        bright4="${config.colorScheme.palette.base0D}";
        bright5="${config.colorScheme.palette.base0E}";
        bright6="${config.colorScheme.palette.base0C}";
        bright7="${config.colorScheme.palette.base07}";
        "16"="${config.colorScheme.palette.base09}";
        "17"="${config.colorScheme.palette.base0F}";
        "18"="${config.colorScheme.palette.base01}";
        "19"="${config.colorScheme.palette.base02}";
        "20"="${config.colorScheme.palette.base04}";
        "21"="${config.colorScheme.palette.base06}";
      };
    };
  };

/*  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        icon-theme = "hicolor";
        font = "Fira Sans";
      };
      colors = {
        background = "${config.colorScheme.palette.base00}ff";#7d";#e6";
        text = "${config.colorScheme.palette.base05}ff";
        match = "${config.colorScheme.palette.base0D}ff";
        selection = "${config.colorScheme.palette.base03}ff";
        selection-text = "${config.colorScheme.palette.base06}ff";
        selection-match = "${config.colorScheme.palette.base0D}ff";
        border = "${config.colorScheme.palette.base05}ff";
      };
      border = {
        width = 1;
        radius = 0;
      };
    };
  };*/
}
