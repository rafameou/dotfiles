{
  lib,
  config,
  pkgs,
  ...
}:
{
  # Mostly stolen from https://github.com/rafaelrc7/dotfiles/users/rafael/hyprland.nix
  home.packages = with pkgs; [
    hyprland
    hypridle
    hyprlock
    hyprpaper
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mod" = "SUPER";
      exec-once = [
        "systemctl --user restart xdg-desktop-portal-gtk"
        "waybar"
        "nm-applet --indicator"
        "${pkgs.swaynotificationcenter}/bin/swaync"
        "${pkgs.wl-clipboard}/bin/wl-paste --watch ${pkgs.cliphist}/bin/cliphist store"
        "${pkgs.swaybg}/bin/swaybg -m tile -i ~/wallpaper"
        "${pkgs.udiskie}/bin/udiskie -t"
        "${pkgs.gammastep}/bin/gammastep -l geoclue2 -m wayland"
        "${pkgs.kdePackages.kdeconnect-kde}/bin/kdeconnect-indicator"
        "${pkgs.trayscale}/bin/trayscale --hide=window"
        "polkit-mate-authentication-agent-1"
        "${pkgs.blueman}/bin/blueman-applet"
      ];

      bind =
        [
          "$mod, RETURN, exec, foot"
          "$mod, D, exec, fuzzel"
          "$mod, Q, exec, qutebrowser"
          "$mod, C, exec, octave --gui"

          #", Print, exec, ${pkgs.slurp}/bin/slurp | ${pkgs.grim}/bin/grim -g - - | ${pkgs.wl-clipboard}/bin/wl-copy"
          ", Print, exec, ${pkgs.grim}/bin/grim -g '$(${pkgs.slurp}/bin/slurp)' - | ${pkgs.swappy}/bin/swappy -f -"
          "$mod, F, fullscreen, 0"
          "$mod, M, fullscreen, 1"
          "$mod + SHIFT, F, fullscreen, 2"
          "$mod + SHIFT, Q, killactive"
          "$mod + SHIFT, S, pin"
          "$mod + SHIFT, SPACE, togglefloating"
          "$mod + SHIFT, E, exec, ${pkgs.wlogout}/bin/wlogout"
          # "$mod + CTRL, L, exec, ${pkgs.hyprlock}/bin/hyprlock --immediate"
          "$mod + CTRL, L, exec, ${pkgs.swaylock}/bin/swaylock -Ffk -c 000000"
          "$mod + SHIFT, N, exec, ${pkgs.swaynotificationcenter}/bin/swaync-client -t -sw"

          ", XF86MonBrightnessUp, exec, ${pkgs.brightnessctl}/bin/brightnessctl set 10%+"
          ", XF86MonBrightnessDown, exec, ${pkgs.brightnessctl}/bin/brightnessctl set 10%-"
          "SHIFT, XF86AudioMute, exec, ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

          "$mod, W, togglegroup"
          # "$mod, O, pseudo,"
          # "$mod, S, togglesplit"
          # "$mod + CTRL, H, layoutmsg, preselect, l"
          # "$mod + CTRL, J, layoutmsg, preselect, d"
          # "$mod + CTRL, K, layoutmsg, preselect, u"
          # "$mod + CTRL, L, layoutmsg, preselect, r"
          "$mod + ALT, H, changegroupactive, b"
          "$mod + ALT, L, changegroupactive, f"
          "$mod, H, movefocus, l"
          "$mod, J, movefocus, d"
          "$mod, K, movefocus, u"
          "$mod, L, movefocus, r"
          "$mod + SHIFT, H, movewindoworgroup, l"
          "$mod + SHIFT, J, movewindoworgroup, d"
          "$mod + SHIFT, K, movewindoworgroup, u"
          "$mod + SHIFT, L, movewindoworgroup, r"
        ]
        ++ (builtins.concatLists (
          builtins.genList (
            i:
            let
              ws = i + 1;
            in
            [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          ) 9
        ));

      bindel = [
        ", XF86AudioRaiseVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        "ALT, XF86AudioRaiseVolume, exec, ${pkgs.playerctl}/bin/playerctl volume 0.1+"
        "ALT, XF86AudioLowerVolume, exec, ${pkgs.playerctl}/bin/playerctl volume 0.1-"
      ];

      bindl = [
        ", XF86AudioMute, exec, ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
        ", XF86AudioStop, exec, ${pkgs.playerctl}/bin/playerctl stop"
        ", XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl previous"
        ", XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl next"
        "SHIFT, XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl position 10-"
        "SHIFT, XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl position 10+"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      general = {
        layout = "dwindle";

        gaps_in = 10;
        gaps_out = 10;
        border_size = 1;
        no_border_on_floating = false;

        resize_on_border = true;
        hover_icon_on_border = true;

        "col.active_border" = "rgb(${config.colorScheme.palette.base05})";
        "col.inactive_border" = "rgb(${config.colorScheme.palette.base0D})";
      };

      group = {
        "col.border_active" = "rgb(${config.colorScheme.palette.base05})";
        "col.border_inactive" = "rgb(${config.colorScheme.palette.base0D})";
      };

      decoration = {
        rounding = 5;

        active_opacity = 1.0;
        inactive_opacity = 1.0;
        fullscreen_opacity = 1.0;

        dim_inactive = false;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          offset = "0 0";
          scale = "1.0";
        };

        blur = {
          enabled = false;
          size = 8;
          passes = 1;
          ignore_opacity = false;
          new_optimizations = true;
          popups = false;
        };
      };

      animations = {
        enabled = true;
        first_launch_animation = true;
        bezier = [
          "overshot, 0.05, 0.9, 0.1, 1.1"
        ];
        animation = [
          "windows, 1, 4, default, popin 80%"
          "fade, 1, 4, default"
          "borderangle, 0"
          "workspaces, 1, 4, overshot, slidefade"
        ];
      };

      input = {
        kb_layout = "br,br";
        kb_model = "abnt2,abnt2";
        kb_variant = ",nativo";

        numlock_by_default = true;
        resolve_binds_by_sym = true;

        follow_mouse = 1;

        touchpad = {
          disable_while_typing = true;
          middle_button_emulation = true;
          clickfinger_behavior = true;
          tap-to-click = true;
          drag_lock = true;
          tap-and-drag = true;
        };
      };

      env = [
        "GDK_BACKEND,wayland,x11"
        "QT_QPA_PLATFORM,wayland;xcb"
        "SDL_VIDEODRIVER,wayland"
        "CLUTTER_BACKEND,wayland"

        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"

        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "_JAVA_AWT_WM_NONREPARENTING,1"

        "MOZ_ENABLE_WAYLAND,1"

        "TERMINAL,foot"
        "EXPLORER,dolphin"
      ];

      cursor = {
        no_warps = false;
        inactive_timeout = 5;
        default_monitor = "";
      };

      windowrulev2 = [
        # Stolen from https://github.com/rafaelrc7/dotfiles/blob/master/users/rafael/hyprland.nix
        # Fix flameshot on multiple monitors
        "pin, class:(flameshot), title:(flameshot)"
        "suppressevent fullscreen, class:(flameshot), title:(flameshot)"
        "float, class:(flameshot), title:(flameshot)"
        "monitor 0, class:(flameshot), title:(flameshot)"
        "move 0 0, class:(flameshot), title:(flameshot)"
      ];
    };

    systemd = {
      enable = true;
      enableXdgAutostart = true;
      variables = [
        "DISPLAY"
        "WAYLAND_DISPLAY"
        "HYPRLAND_INSTANCE_SIGNATURE"
        "XDG_CURRENT_DESKTOP"
        "XDG_SESSION_TYPE"
        "NIXOS_OZONE_WL"
        "XCURSOR_THEME"
        "XCURSOR_SIZE"
        "QT_QPA_PLATFORMTHEME"
        "QT_QPA_PLATFORM"
        "QT_PLUGIN_PATH"
        "QT_STYLE_OVERRIDE"
        "SDL_VIDEODRIVER"
        "_JAVA_AWT_WM_NONREPARENTING"
        "PATH"
      ];

      extraCommands = [
        "${pkgs.systemd}/bin/systemctl --user stop hyprland-session.target"
        "${pkgs.systemd}/bin/systemctl --user reset-failed"
        "${pkgs.systemd}/bin/systemctl --user start hyprland-session.target"
      ];
    };

    xwayland.enable = true;
  };
}
