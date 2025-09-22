{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
{
  # https://github.com/rafaelrc7/dotfiles/blob/master/users/rafael/waybar.nix
  imports = [ ../nix-colors.nix ];

  programs.waybar = {
    enable = true;
    settings = {
      trayBar = {
        layer = "bottom";
        position = "bottom";
        height = 24;
        spacing = 5;
        modules-left = [ "wlr/taskbar" ];
        modules-right = [ "niri/workspaces" ];

        "wlr/taskbar" = {
          icon-size = 20;
          on-click = "activate";
          format = "{icon} {title:.15}";
        };
      };
      bottomBar = {
        layer = "bottom";
        position = "top";
        height = 24; # 25;
        spacing = 5; # 10;

        modules-left = [
          "custom/applications"
          "custom/places"
          "custom/system"
          #"hyprland/workspaces"
          #"sway/workspaces"

          #"sway/mode"
          #"sway/scratchpad" # "custom/media" "wlr/taskbar"
          # "mpris"
          #"wlr/taskbar"
        ];
        modules-center = [ ];
        modules-right = [
          "idle_inhibitor"
          "pulseaudio"
          "systemd-failed-units" # "hyprland/language" "sway/language"
          "network"
          "temperature"
          "cpu"
          "memory"
          "memory#swap"
          "battery"
          "privacy"
          #"user"
          "backlight"
          "clock"
          "custom/weather"
          "custom/notification"
          "tray"
          "custom/logout"
        ];

        "custom/applications" = {
          format = " Applications";
          on-click = "fuzzel -F categories -a top-left";
        };

        "custom/places" = {
          format = " Places";
          on-click = "xdg-open \"$(ls -1 -d $HOME/*/ | fuzzel -a top-left -d)\"";
        };

        "custom/system" = {
          format = "󰌽 System";
          on-click = "wlogout";
        };

        tray = {
          # icon-size = 21;
          spacing = 5;
        };

        "custom/notification" = {
          "tooltip" = false;
          "format" = "{icon}";
          "format-icons" = {
            "notification" = "<span color='#FABD2F'>*</span>";
            "none" = "";
            "dnd-notification" = "<span color='#FABD2F'>*</span>";
            "dnd-none" = "";
            "inhibited-notification" = "<span color='#FB4934'>*</span>";
            "inhibited-none" = "";
            "dnd-inhibited-notification" = "<span color='#FB4934'>*</span>";
            "dnd-inhibited-none" = "";
          };
          "return-type" = "json";
          "exec-if" = "which swaync-client";
          "exec" = "${pkgs.swaynotificationcenter}/bin/swaync-client -swb";
          "on-click" = "${pkgs.swaynotificationcenter}/bin/swaync-client -t -sw";
          "on-click-right" = "${pkgs.swaynotificationcenter}/bin/swaync-client -d -sw";
          "escape" = true;
        };

        backlight = {
          # "device" = "acpi_video1";
          format = "{icon}{percent}%";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
        };

        "sway/workspaces" = {
          all-outputs = true;
          format = "{name}{icon}";
          format-icons = {
            "urgent" = "";
            "focused" = "";
            "default" = "";
          };
        };

        "sway/window" = {
          icon-size = 20;
          icon = false;
        };

        "sway/scratchpad" = {
          format = "{icon} {count}";
          show-empty = false;
          format-icons = [
            ""
            ""
          ];
          tooltip = true;
          tooltip-format = "{app}: {title}";
        };

        user = {
          format = "󰄛up {work_d}d{work_H}h{work_M}m";
          weight = 20;
          height = 20;
          icon = false;
        };

        keyboard-state = {
          numlock = true;
          capslhock = true;
          format = "{name}{icon}";
          format-icons = {
            locked = "LCK";
            unlocked = "UNL";
          };
        };

        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            "activated" = "<span color='#FABD2F'></span>";
            "deactivated" = "<span color='#D3869B'></span>";
          };
        };

        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{icon}{capacity}% {power:.3}W</span>";
          format-charging = "<span color='#8EC07C'>󰂅{capacity}% {power:.3}W</span>";
          format-plugged = "<span color='#8EC07C'>{capacity}% {power:.3}W</span>";
          format-alt = "{time}{icon} ";
          format-icons = [
            "<span color='#FB4934'>"
            "<span color='#FE8019'>"
            "<span color='#8EC07C'>"
            "<span color='#B8BB26'>"
            "<span color='#B8BB26'>"
          ];
        };

        pulseaudio = {
          scroll-step = 1;
          format = "{icon}{volume}%{format_source}";
          format-bluetooth = "{icon}{volume}%{format_source}";
          format-bluetooth-muted = "{icon}󰝟{format_source}";
          format-muted = "󰝟{format_source}";
          format-source = "{volume}%";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              "󰕿"
              "󰖀"
              "󰕾"
            ];
          };
          on-click = "pavucontrol-qt";
        };

        "custom/weather" = {
          format = "{}°C";
          tooltip = true;
          interval = 3600;
          exec = "wttrbar --lang pt --location ponta-grossa";
          return-type = "json";
        };

        "sway/language" = {
          format = "{}";
          on-click = "swaymsg input type:keyboard xkb_switch_layout next";
        };

        network = {
          format-wifi = "{signalStrength}%";
          format-ethernet = "{ifname}";
          tooltip-format = "{ifname} via {gwaddr} at {ipaddr}";
          format-linked = "No IP";
          format-disconnected = "⚠Offline";
        };

        cpu = {
          format = "{icon}{usage}%";
          format-icons = [
            "<span color='#B8BB26'>▁</span>"
            "<span color='#8EC07C'>▂</span>"
            "<span color='#83A598'>▃</span>"
            "<span color='#FABD2F'>▄</span>"
            "<span color='#FE8019'>▅</span>"
            "<span color='#FE8019'>▆</span>"
            "<span color='#FB4934'>▇</span>"
            "<span color='#FB4934'>█</span>"
          ];
          tooltip = false;
        };

        memory = {
          format = "󰍛{used}/{total}G";
        };

        "memory#swap" = {
          format = "󰓡{swapUsed}/{swapTotal}G";
        };

        temperature = {
          critical-threshold = 80;
          format = "{icon} {temperatureC}°C</span>";
          format-icons = [
            "<span color='#B8BB26'>"
            "<span color='#FABD2F'>"
            "<span color='#FB4934'>"
          ];
        };

        clock = {
          timezone = lib.mkDefault "America/Sao_Paulo";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format = "󰥔{:%T %d/%m/%Y}";
          interval = 1;
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            format-months = "<span color='#ffead3'><b>{}</b></span>";
            format-days = "<span color='#ecc6d9'><b>{}</b></span>";
            format-weeks = "<span color='#99ffdd'><b>W{}</b></span>";
            format-weekdays = "<span color='#ffcc66'><b>{}</b></span>";
            format-today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            on-click-right = "mode";
            on-scroll-up = "tz_up";
            on-scroll-down = "tz_down";
            #on-scroll-up = "shift_up";
            #on-scroll-down = "shift_down";
          };
        };
      };
    };

    style = ''
      *{
      font-family: Fira Sans, FiraCode Nerd Font Mono, Fira Sans;
      font-size: 18px;
      transition-duration: 0;
      }

      window#waybar {
      color: #${config.colorScheme.palette.base05};
      background-color: #${config.colorScheme.palette.base00};
      }

      window#waybar.hidden {
      opacity: 0.2;
      }

      window#waybar.termite {
      background-color: #3F3F3F;
      }

      window#waybar.chromium {
      background-color: #000000;
      border: none;
      }

      #taskbar button {
      padding-top: 0;
      padding-bottom: 0;
      box-shadow: inset 0 0 0 1px #${config.colorScheme.palette.base02};
      margin-top: 0px;
      margin-bottom: 0px;
      margin-left: 5px;
      background: radial-gradient(ellipse, rgba(80, 73, 69, 0.9) 0%, rgba(0,0,0,0) 100%);
      }

      #taskbar button.hover,
      #taskbar button.active {
      background: radial-gradient(ellipse, rgba(${inputs.nix-colors.lib.conversions.hexToRGBString "," config.colorScheme.palette.base00}, 0.9) 0%, rgba(${inputs.nix-colors.lib.conversions.hexToRGBString "," config.colorScheme.palette.base02}, 1) 100%);
      }

      button {
      box-shadow: inset 0 -3px transparent;
      border: none;
      min-height: 24px;
      min-width: 16px;
      }

      button:hover {
      background: inherit;
      /*box-shadow: inset 0 -3px #ffffff;*/
      }

      #workspaces button {
      padding: 0 5px;
      background-color: transparent;
      color: #A89984;
      transition-duration: .2s;
      background: #${config.colorScheme.palette.base02};
      }

      #workspaces button.active,
      #workspaces button.focused,
      #workspaces button:hover {
      /*background: ;*/
      background: radial-gradient(circle, rgba(150,150,150,1) 0%, rgba(0,0,0,0) 100%);
      /*background: radial-gradient(circle, rgba(255,255,255,1) 0%, rgba(0,0,0,0) 100%);*/
      color: #${config.colorScheme.palette.base05};
      }

      #workspaces button.urgent {
      color: #FB4934;
      }

      #mode {
      background-color: #64727D;
      border-bottom: 3px solid #ffffff;
      }

      #window,
      #workspaces {
      margin: 0 4px;
      }

      #waybar.empty #window {
      border: none;
      background: none;
      }

      .modules-right > widget {
      margin: 0 4px;
      box-shadow: inset 0 0 0 1px #504945;
      background: rgba(70,70,70,0.5);
      }

      #wireplumber.muted,
      #network.disconnected,
      #pulseaudio.muted {
      color: #FB4934;
      }

      #tray > .passive {
      -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
      -gtk-icon-effect: highlight;
      background-color: #eb4d4b;
      }
    '';
  };
}
