{ inputs, lib, config, pkgs, ... }:
{
  imports = [
    ./waybar.nix
  ];
  home.packages = with pkgs; [
    brightnessctl
    playerctl

    swaybg
    swaylock
    cliphist
    wl-clipboard
    grim
    slurp
    wf-recorder
    fuzzel
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
  };

  wayland.windowManager.sway = {
    enable = true;
    /*package = pkgs.swayfx;*/
    config = rec {
      modifier = "Mod4";
      fonts = {
        names = ["Fira Sans"];
        style = "Regular";
        size = 10.0;
      }; 
      /*menu = "${pkgs.wofi}/bin/wofi --show=drun --insensitive --allow-images --hide-scroll | ${pkgs.findutils}/bin/xargs swaymsg exec --";*/
      /*menu = "${pkgs.fuzzel}/bin/fuzzel | ${pkgs.findutils}/bin/xargs swaymsg exec --";*/
      menu = ''${pkgs.nixpkgs-stable.j4-dmenu-desktop}/bin/j4-dmenu-desktop --dmenu="${pkgs.bemenu}/bin/bemenu -i -l 10"'';
      /*bars = [{ command = "${pkgs.waybar}/bin/waybar"; }];*/
      bars = [
        {
          fonts = {
            names = ["Fira Sans"];
            style = "Regular";
            size = 10.0;
          };
          position = "top";
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml";
          /*---------------------------------------------------------|
          | Stolen from https://github.com/tinted-theming/base16-i3/ |
          |---------------------------------------------------------*/
          colors = {
            background = "#${config.colorScheme.colors.base00}";
            separator = "#${config.colorScheme.colors.base01}";
            statusline = "#${config.colorScheme.colors.base04}";
            focusedWorkspace = {
              border = "#${config.colorScheme.colors.base05}";
              background = "#${config.colorScheme.colors.base0D}"; 
              text = "#${config.colorScheme.colors.base00}";
            };
            activeWorkspace = {
              border = "#${config.colorScheme.colors.base05}";
              background = "#${config.colorScheme.colors.base03}";  
              text = "#${config.colorScheme.colors.base00}";
            };
            inactiveWorkspace = {
              border = "#${config.colorScheme.colors.base03}";
              background = "#${config.colorScheme.colors.base01}";
              text = "#${config.colorScheme.colors.base05}";
            };
            urgentWorkspace = {
              border = "#${config.colorScheme.colors.base08}";
              background = "#${config.colorScheme.colors.base08}";
              text = "#${config.colorScheme.colors.base00}";
            };
            bindingMode = {
              border = "#${config.colorScheme.colors.base00}";
              background = "#${config.colorScheme.colors.base0A}";
              text = "#${config.colorScheme.colors.base00}";
            };
          };
        }
      ];
      colors = {
        focused = {
          border = "#${config.colorScheme.colors.base05}";
          background = "#${config.colorScheme.colors.base0D}";
          text = "#${config.colorScheme.colors.base00}";
          indicator = "#${config.colorScheme.colors.base0D}";
          childBorder = "#${config.colorScheme.colors.base0C}";
        };
        focusedInactive = {
          border = "#${config.colorScheme.colors.base01}";
          background = "#${config.colorScheme.colors.base01}";
          text = "#${config.colorScheme.colors.base05}";
          indicator = "#${config.colorScheme.colors.base03}";
          childBorder = "#${config.colorScheme.colors.base01}";
        };
        unfocused = {
          border = "#${config.colorScheme.colors.base01}";
          background = "#${config.colorScheme.colors.base00}";
          text = "#${config.colorScheme.colors.base05}";
          indicator = "#${config.colorScheme.colors.base01}";
          childBorder = "#${config.colorScheme.colors.base01}";
        };
        urgent = {
          border = "#${config.colorScheme.colors.base08}";
          background = "#${config.colorScheme.colors.base08}";
          text = "#${config.colorScheme.colors.base00}";
          indicator = "#${config.colorScheme.colors.base08}";
          childBorder = "#${config.colorScheme.colors.base08}";
        };
        placeholder = {
          border = "#${config.colorScheme.colors.base00}";
          background = "#${config.colorScheme.colors.base00}";
          text = "#${config.colorScheme.colors.base05}";
          indicator = "#${config.colorScheme.colors.base00}";
          childBorder = "#${config.colorScheme.colors.base00}";
        };
        background = "#${config.colorScheme.colors.base07}"; 
      };
      terminal = "kitty"; 
      input = {
        "type:keyboard" = {
          xkb_layout = "br,br";
          xkb_model = "abnt2,abnt2";
          xkb_variant = ",thinkpad";
          xkb_numlock = "enabled,disabled";
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
      workspaceLayout = "default";
      gaps = rec {
      smartBorders = "on";
      smartGaps = true;
      inner = 4;
      outer = -inner;
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
        {command = "--no-startup-id ${pkgs.swaybg}/bin/swaybg -m fill -i ~/back"; } #fill
        /*{command = "--no-startup-id ${pkgs.udiskie}/bin/udiskie -t"; }*/
        {command = "--no-startup-id ${pkgs.pcmanfm-qt}/bin/pcmanfm-qt -d"; }
        {command = "--no-startup-id ${pkgs.gammastep}/bin/gammastep -l geoclue2 -m wayland"; }
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

  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        icon-theme = "hicolor";
        font = "Fira Sans";
      };
      /*colors = {
      background = "303446ff";#7d";#e6";
      text = "ffffffff";
      selection = "464646ff";
      selection-text = "ffffffff";
      border = "ffffff00";
      };*/
      border = {
        width = 1;
        radius = 0;
      };
    };
  };
}
