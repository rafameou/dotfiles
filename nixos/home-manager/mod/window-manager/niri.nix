{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:
{
  programs.niri = {
    settings = {
      input.keyboard.xkb = {
        layout = "br";
        model = "abnt2";
      };
      layout = {
        gaps = 10;
        always-center-single-column = true;
        center-focused-column = "on-overflow"; # "always";
        focus-ring = {
          enable = false;
          width = 1;
          active.color = "#${config.colorScheme.palette.base05}";
          inactive.color = "#${config.colorScheme.palette.base01}";
        };
        border = {
          enable = true;
          width = 1;
          active.color = "#${config.colorScheme.palette.base05}";
          inactive.color = "#${config.colorScheme.palette.base01}";
          #urgent.color = "#${config.colorScheme.palette.base08}";
        };
        shadow = {
          enable = false;
          softness = 40;
          spread = 5;
          offset = {
            x = 0;
            y = 5;
          };
          color = "#${config.colorScheme.palette.base05}64";
          inactive-color = "#${config.colorScheme.palette.base01}64";
        };
      };
      spawn-at-startup = [
        {
          command = [
            "systemctl"
            "--user"
            "import-environment"
            "WAYLAND_DISPLAY"
            "DISPLAY"
            "XDG_CURRENT_DESKTOP"
            "XCURSOR_SIZE"
            "XCURSOR_THEME"
          ];
        }
        {
          command = [
            "dbus-update-activation-environment"
            "WAYLAND_DISPLAY"
            "DISPLAY"
            "XDG_CURRENT_DESKTOP"
            "XCURSOR_SIZE"
            "XCURSOR_THEME"
          ];
        }
        {
          command = [
            "systemctl"
            "--user"
            "restart"
            "xdg-desktop-portal-gtk"
          ];
        }
        {
          command = [
            "waybar"
          ];
        }
        {
          command = [
            "wl-paste"
            "--watch"
            "cliphist"
            "store"
          ];
        }
        {
          command = [
            "gammastep"
            "-l"
            "geoclue2"
            "-m"
            "wayland"
          ];
        }
        { command = [ "swaync" ]; }
        {
          command = [
            "nm-applet"
            "--indicator"
          ];
        }
        { command = [ "blueman-tray" ]; }
        {
          command = [
            "pcmanfm-qt"
            "--daemon-mode"
          ];
        }
        { command = [ "xwayland-satellite" ]; }
        {
          command = [
            "solaar"
            "-w"
            "hide"
            "-b"
            "regular"
          ];
        }
        {
          command = [
            "openrgb"
            "--startminimized"
          ];
        }
        {
          command = [
            "swaybg"
            "-m"
            "tile"
            "-i"
            "/home/rafameou/wallpaper"
          ];
        }
      ];
      cursor = {
        theme = "phinger-cursors-light";
        size = 36;
      };
      clipboard = {
        disable-primary = true;
      };
      prefer-no-csd = true;
      screenshot-path = null;
      window-rules = [
        {
          geometry-corner-radius =
            let
              r = 12.0;
            in
            {
              top-left = r;
              top-right = r;
              bottom-left = r;
              bottom-right = r;
            };
          clip-to-geometry = true;
        }
        {
          matches = [
            {
              app-id = "^firefox$";
              title = "^Picture-in-Picture$";
            }
          ];
          open-floating = true;
        }
      ];
      environment = {
        "NIXOS_OZONE_WL" = "1";
        "ELECTRON_OZONE_PLATFORM_HINT" = "wayland";
        "_JAVA_AWT_WM_NONREPARENTING" = "1";
        "DISPLAY" = ":0";
        "QT_QPA_PLATFORMTHEME" = "qt6ct";
      };
      binds = with config.lib.niri.actions; {
        "Mod+Shift+A".action = show-hotkey-overlay;
        "Mod+T".action = spawn "foot";
        "Mod+D".action = spawn "fuzzel";
        "Mod+P".action = spawn "pcmanfm-qt";
        "Mod+Alt+L".action = spawn "${pkgs.swaylock}/bin/swaylock" "-Ffk" "-c" "000000";

        "XF86AudioPlay".action = spawn "${pkgs.playerctl}/bin/playerctl" "play-pause";
        "XF86AudioStop".action = spawn "${pkgs.playerctl}/bin/playerctl" "stop";
        "XF86AudioPrev".action = spawn "${pkgs.playerctl}/bin/playerctl" "previous";
        "XF86AudioNext".action = spawn "${pkgs.playerctl}/bin/playerctl" "next";
        "shift+XF86AudioPrev".action = spawn "${pkgs.playerctl}/bin/playerctl" "position" "10-";
        "shift+XF86AudioNext".action = spawn "${pkgs.playerctl}/bin/playerctl" "position" "10+";
        "shift+XF86AudioLowerVolume".action = spawn "${pkgs.playerctl}/bin/playerctl" "volume" "0.1-";
        "shift+XF86AudioRaiseVolume".action = spawn "${pkgs.playerctl}/bin/playerctl" "volume" "0.1+";
        "XF86AudioMute".action =
          spawn "${pkgs.wireplumber}/bin/wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@"
            "toggle";
        "XF86AudioLowerVolume".action =
          spawn "${pkgs.wireplumber}/bin/wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@"
            "5%-";
        "XF86AudioRaiseVolume".action =
          spawn "${pkgs.wireplumber}/bin/wpctl" "set-volume" "-l" "1.5" "@DEFAULT_AUDIO_SINK@"
            "5%+";
        "XF86AudioMicMute".action =
          spawn "${pkgs.wireplumber}/bin/wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@"
            "toggle";

        "XF86MonBrightnessUp".action = spawn "${pkgs.brightnessctl}/bin/brightnessctl" "set" "10%+";
        "XF86MonBrightnessDown".action = spawn "${pkgs.brightnessctl}/bin/brightnessctl" "set" "10%-";

        "Mod+Shift+Q".action = close-window;

        "Mod+Left".action = focus-column-left;
        "Mod+Down".action = focus-window-down;
        "Mod+Up".action = focus-window-up;
        "Mod+Right".action = focus-column-right;
        "Mod+H".action = focus-column-left;
        "Mod+J".action = focus-window-down;
        "Mod+K".action = focus-window-up;
        "Mod+L".action = focus-column-right;

        "Mod+Ctrl+Left".action = move-column-left;
        "Mod+Ctrl+Down".action = move-window-down;
        "Mod+Ctrl+Up".action = move-window-up;
        "Mod+Ctrl+Right".action = move-column-right;
        "Mod+Ctrl+H".action = move-column-left;
        "Mod+Ctrl+J".action = move-window-down;
        "Mod+Ctrl+K".action = move-window-up;
        "Mod+Ctrl+L".action = move-column-right;

        "Mod+Home".action = focus-column-first;
        "Mod+End".action = focus-column-last;
        "Mod+Ctrl+Home".action = move-column-to-first;
        "Mod+Ctrl+End".action = move-column-to-last;

        "Mod+Shift+Left".action = focus-monitor-left;
        "Mod+Shift+Down".action = focus-monitor-down;
        "Mod+Shift+Up".action = focus-monitor-up;
        "Mod+Shift+Right".action = focus-monitor-right;
        "Mod+Shift+H".action = focus-monitor-left;
        "Mod+Shift+J".action = focus-monitor-down;
        "Mod+Shift+K".action = focus-monitor-up;
        "Mod+Shift+L".action = focus-monitor-right;

        "Mod+Shift+Ctrl+Left".action = move-column-to-monitor-left;
        "Mod+Shift+Ctrl+Down".action = move-column-to-monitor-down;
        "Mod+Shift+Ctrl+Up".action = move-column-to-monitor-up;
        "Mod+Shift+Ctrl+Right".action = move-column-to-monitor-right;
        "Mod+Shift+Ctrl+H".action = move-column-to-monitor-left;
        "Mod+Shift+Ctrl+J".action = move-column-to-monitor-down;
        "Mod+Shift+Ctrl+K".action = move-column-to-monitor-up;
        "Mod+Shift+Ctrl+L".action = move-column-to-monitor-right;

        "Mod+Page_Down".action = focus-workspace-down;
        "Mod+Page_Up".action = focus-workspace-up;
        "Mod+U".action = focus-workspace-down;
        "Mod+I".action = focus-workspace-up;
        "Mod+Ctrl+Page_Down".action = move-column-to-workspace-down;
        "Mod+Ctrl+Page_Up".action = move-column-to-workspace-up;
        "Mod+Ctrl+U".action = move-column-to-workspace-down;
        "Mod+Ctrl+I".action = move-column-to-workspace-up;

        "Mod+Shift+Page_Down".action = move-workspace-down;
        "Mod+Shift+Page_Up".action = move-workspace-up;
        "Mod+Shift+U".action = move-workspace-down;
        "Mod+Shift+I".action = move-workspace-up;

        "Mod+WheelScrollRight".action = focus-column-right;
        "Mod+WheelScrollLeft".action = focus-column-left;
        "Mod+WheelScrollDown".action = focus-column-right;
        "Mod+WheelScrollUp".action = focus-column-left;
        "Mod+Shift+WheelScrollRight".action = move-column-right;
        "Mod+Shift+WheelScrollLeft".action = move-column-left;
        "Mod+Shift+WheelScrollDown".action = move-column-right;
        "Mod+Shift+WheelScrollUp".action = move-column-left;

        "Mod+Ctrl+WheelScrollRight".action = focus-workspace-down;
        "Mod+Ctrl+WheelScrollLeft".action = focus-workspace-up;
        "Mod+Ctrl+WheelScrollDown".action = focus-workspace-down;
        "Mod+Ctrl+WheelScrollUp".action = focus-workspace-up;
        "Mod+Shift+Ctrl+WheelScrollRight".action = move-column-to-workspace-down;
        "Mod+Shift+Ctrl+WheelScrollLeft".action = move-column-to-workspace-up;
        "Mod+Shift+Ctrl+WheelScrollDown".action = move-column-to-workspace-down;
        "Mod+Shift+Ctrl+WheelScrollUp".action = move-column-to-workspace-up;

        "Mod+1".action = focus-workspace 1;
        "Mod+2".action = focus-workspace 2;
        "Mod+3".action = focus-workspace 3;
        "Mod+4".action = focus-workspace 4;
        "Mod+5".action = focus-workspace 5;
        "Mod+6".action = focus-workspace 6;
        "Mod+7".action = focus-workspace 7;
        "Mod+8".action = focus-workspace 8;
        "Mod+9".action = focus-workspace 9;
        /*
          "Mod+Ctrl+1".action = move-column-to-workspace 1;
          "Mod+Ctrl+2".action = move-column-to-workspace 2;
          "Mod+Ctrl+3".action = move-column-to-workspace 3;
          "Mod+Ctrl+4".action = move-column-to-workspace 4;
          "Mod+Ctrl+5".action = move-column-to-workspace 5;
          "Mod+Ctrl+6".action = move-column-to-workspace 6;
          "Mod+Ctrl+7".action = move-column-to-workspace 7;
          "Mod+Ctrl+8".action = move-column-to-workspace 8;
          "Mod+Ctrl+9".action = move-column-to-workspace 9;
        */

        "Mod+BracketLeft".action = consume-or-expel-window-left;
        "Mod+BracketRight".action = consume-or-expel-window-right;

        "Mod+Comma".action = consume-window-into-column;
        "Mod+Period".action = expel-window-from-column;

        "Mod+R".action = switch-preset-column-width;
        "Mod+Shift+R".action = switch-preset-window-height;
        "Mod+Ctrl+R".action = reset-window-height;
        "Mod+F".action = fullscreen-window; # maximize-column;
        "Mod+Shift+F".action = maximize-column; # fullscreen-window;

        "Mod+Ctrl+F".action = expand-column-to-available-width;
        "Mod+C".action = center-column;

        "Mod+Minus".action = set-column-width "-10%";
        "Mod+Equal".action = set-column-width "+10%";

        "Mod+Shift+Minus".action = set-window-height "-10%";
        "Mod+Shift+Equal".action = set-window-height "+10%";

        "Mod+V".action = toggle-window-floating;
        "Mod+Shift+V".action = switch-focus-between-floating-and-tiling;

        "Mod+W".action = toggle-column-tabbed-display;

        "Print".action = screenshot;
        #"Ctrl+Print".action = screenshot-screen;
        #"Alt+Print".action = screenshot-window;

        #"Mod+Escape".action = toggle-keyboard-shortcuts-inhibit;

        "Mod+Shift+E".action = quit;
        "Ctrl+Alt+Delete".action = quit;
        "Mod+Shift+P".action = power-off-monitors;
      };
    };
  };
}
