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
    #wf-recorder #broken 03-11-2024

    #dunst

    wayland-pipewire-idle-inhibit

    blueman
    swaynotificationcenter

    mate.mate-polkit
  ];

  programs.fuzzel.enable = true;

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
  };

  systemd.user.services = {
    wayland-idle-pipewire-inhibit-serv = {
      Unit = {
        Wants = "sway-session.target";
        After = "sway-session.target";
      };

      Service = {
        Type = "simple";
        ExecStart = "${pkgs.wayland-pipewire-idle-inhibit}/bin/wayland-pipewire-idle-inhibit -d 5";
        Restart = "on-failure";
        RestartSec = 30;
      };

      Install = {
        WantedBy = [ "sway-session.target" ];
      };
    };
  };

  wayland.windowManager.sway = {
    enable = true;
    #package = pkgs.swayfx;
    config = rec {
      modifier = "Mod4";
      fonts = {
        names = ["terminus"];
        style = "Regular";
        size = 12.0;
      }; 
      #menu = "${pkgs.nixpkgs-stable.j4-dmenu-desktop}/bin/j4-dmenu-desktop | wmenu | xargs swaymsg exec --";
      menu = "fuzzel";
      bars = [
        /*{
          fonts = {
            names = ["Fira Sans"];
            style = "Regular";
            size = 10.0;
          };
          trayOutput = "none";
          position = "bottom";
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-bottom.toml";
          }*/
          { command = "${pkgs.waybar}/bin/waybar"; }
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
          xkb_layout = "br,br";
          xkb_model = "abnt2,abnt2";
          xkb_variant = ",nativo";
          xkb_numlock = "enabled,enabled";
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
        {command = "--no-startup-id systemctl --user import-environment WAYLAND_DISPLAY DISPLAY XDG_CURRENT_DESKTOP SWAYSOCK I3SOCK XCURSOR_SIZE XCURSOR_THEME";}
        {command = "--no-startup-id dbus-update-activation-environment WAYLAND_DISPLAY DISPLAY XDG_CURRENT_DESKTOP SWAYSOCK I3SOCK XCURSOR_SIZE XCURSOR_THEME";}

        {command = "--no-startup-id nm-applet --indicator";}
        {command = "--no-startup-id ${pkgs.swaynotificationcenter}/bin/swaync";}
        {command = "--no-startup-id ${pkgs.wl-clipboard}/bin/wl-paste --watch ${pkgs.cliphist}/bin/cliphist store"; }
        {command = "--no-startup-id ${pkgs.swaybg}/bin/swaybg -m fill -i ~/wallpaper"; } #fill
        /*{command = "--no-startup-id ${pkgs.swww}/bin/swww init & ${pkgs.swww}/bin/swww img ~/back";}*/
        {command = "--no-startup-id ${pkgs.udiskie}/bin/udiskie -t"; }
        {command = "--no-startup-id ${pkgs.gammastep}/bin/gammastep -l geoclue2 -m wayland"; }
        {command = "--no-startup-id ${pkgs.wayland-pipewire-idle-inhibit}/bin/wayland-pipewire-idle-inhibit -d 5";}
        #{command = "--no-startup-id ${pkgs.dunst}/bin/dunst";}

        {command = "--no-startup-id ${pkgs.kdePackages.kdeconnect-kde}/bin/kdeconnect-indicator";}
        {command = "--no-startup-id ${pkgs.trayscale}/bin/trayscale --hide=window";}

        /*mate stuff*/
        /*https://github.com/mate-desktop/mate-wayland-session/blob/master/session/mate-wayland-components.sh#L42*/ 
        /*{command = "--no-startup-id mate-panel"; }*/
        {command = "--no-startup-id polkit-mate-authentication-agent-1"; }
        /*{command = "--no-startup-id mate-notification-daemon"; }
        {command = "--no-startup-id GDK_BACKEND=x11 mate-settings-daemon"; }
        {command = "--no-startup-id caja -n --force-desktop"; }*/

        {command = "--no-startup-id ${pkgs.blueman}/bin/blueman-applet"; }

        {command = "--no-startup-id solaar --window hide --battery-icons solaar"; }

        /*{command = "--no-startup-id volctl";}*/
        /*{command = "--no-startup-id ${pkgs.ayatana-indicator-datetime}/libexec/ayatana-indicator-datetime/ayatana-indicator-datetime-service";}
        {command = "--no-startup-id ${pkgs.ayatana-indicator-display}/libexec/ayatana-indicator-display/ayatana-indicator-display-service";}
        {command = "--no-startup-id ${pkgs.ayatana-indicator-messages}/libexec/ayatana-indicator-messages/ayatana-indicator-messages-service";}
        {command = "--no-startup-id ${pkgs.ayatana-indicator-power}/libexec/ayatana-indicator-power/ayatana-indicator-power-service";}
        {command = "--no-startup-id ${pkgs.ayatana-indicator-session}/libexec/ayatana-indicator-session/ayatana-indicator-session-service";}
        {command = "--no-startup-id ${pkgs.ayatana-indicator-sound}/libexec/ayatana-indicator-sound/ayatana-indicator-sound-service";}*/
      ];
      keybindings = lib.mkOptionDefault {
        "XF86AudioPlay"              = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
        "XF86AudioStop"              = "exec ${pkgs.playerctl}/bin/playerctl stop";
        "XF86AudioPrev"              = "exec ${pkgs.playerctl}/bin/playerctl previous";
        "XF86AudioNext"              = "exec ${pkgs.playerctl}/bin/playerctl next";
        "shift+XF86AudioPrev"        = "exec ${pkgs.playerctl}/bin/playerctl position 10-";
        "shift+XF86AudioNext"        = "exec ${pkgs.playerctl}/bin/playerctl position 10+";
        "shift+XF86AudioLowerVolume" = "exec ${pkgs.playerctl}/bin/playerctl volume 0.1-";
        "shift+XF86AudioRaiseVolume" = "exec ${pkgs.playerctl}/bin/playerctl volume 0.1+";

        #"${alt}+XF86AudioMute" = "exec ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";

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

        "${modifier}+Shift+n" = "exec ${pkgs.swaynotificationcenter}/bin/swaync-client -t -sw";
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
}
