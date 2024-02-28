{ lib, config, pkgs, ... }:
{
  imports = [ ../nix-colors.nix ];
  home.packages = with pkgs; [
    brightnessctl
    playerctl

    lxqt.qterminal

    i3status-rust
    i3lock
    maim
    xclip
    feh
    redshift
    picom
  ];

  xdg.configFile."picom/picom.conf".text = ''
shadows = true;
corner-radius = 10;
round-borders = 1;
rounded-corners-exclude = [
  "class_g = 'i3bar'",
];
unredir-if-possible = false;
  '';


  xsession.windowManager.i3 = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      fonts = {
        names = ["Fira Mono"];
        size = 10.0;
      };
      /*colors stolen from https://github.com/Haze-sh/base16-bemenu/"*/
      menu = ''BEMENU_OPTS="--tb '#${config.colorScheme.palette.base03}' --tf '#${config.colorScheme.palette.base06}' --fb '#${config.colorScheme.palette.base00}' --ff '#${config.colorScheme.palette.base06}' --nb '#${config.colorScheme.palette.base00}' --nf '#${config.colorScheme.palette.base04}' --hb '#${config.colorScheme.palette.base02}' --hf '#${config.colorScheme.palette.base0A}' --sb '#${config.colorScheme.palette.base02}' --sf '#${config.colorScheme.palette.base0A}' --scb '#${config.colorScheme.palette.base00}' --scf '#${config.colorScheme.palette.base0E}'" ${pkgs.nixpkgs-stable.j4-dmenu-desktop}/bin/j4-dmenu-desktop --dmenu="${pkgs.bemenu}/bin/bemenu -i -l 10"'';
      bars = [
        {
          fonts = {
            names = ["Fira Mono"];
            size = 10.0;
          };
          position = "bottom";
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-bottom.toml";
          /*---------------------------------------------------------|
          | Stolen from https://github.com/tinted-theming/base16-i3/ |
          |---------------------------------------------------------*/
          colors = {
            background = "#${config.colorScheme.palette.base00}B2";
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
      terminal = "kitty";
      focus = {
        followMouse = true;
        wrapping = "no";
        mouseWarping = true;
        newWindow = "smart";
      };
      /*workspaceAutoBackAndForth = true;
      workspaceLayout = "default";*/
      gaps = {
        inner = 10;
      };
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
        {command = "--no-startup-id nm-applet --indicator";}
        {command = "--no-startup-id ${pkgs.feh}/bin/feh --bg-fill ~/back"; }
        /*{command = "--no-startup-id ${pkgs.udiskie}/bin/udiskie -t"; }*/
        {command = "--no-startup-id ${pkgs.pcmanfm-qt}/bin/pcmanfm-qt -d"; }
        {command = "--no-startup-id ${pkgs.gammastep}/bin/gammastep -l geoclue2 -m randr"; } 
        {command = "--no-startup-id ${pkgs.picom}/bin/picom"; }
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
        "${modifier}+equal" = "gaps inner current toggle 10";

        "XF86AudioMute"        = "exec ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "XF86AudioLowerVolume" = "exec ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        "XF86AudioRaiseVolume" = "exec ${pkgs.wireplumber}/bin/wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+";

        "XF86MonBrightnessUp"   = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 10%+";
        "XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 10%-";

        "Print"          = "exec --no-startup-id ${pkgs.maim}/bin/maim -s | ${pkgs.xclip}/bin/xclip -selection clipboard -t image/png"; #https://superuser.com/a/1803843
        "${modifier}+l"  = "exec --no-startup-id ${pkgs.i3lock}/bin/i3lock -c 000000";
      };
    };
  };
}
