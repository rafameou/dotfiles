{lib, pkgs,...}:
{
  # https://github.com/rafaelrc7/dotfiles/blob/master/users/rafael/waybar.nix
  imports = [ ../nix-colors.nix ];

  programs.waybar = {
    enable = true;
    settings = [{
      layer = "bottom";
      position = "top";
      height = 24;#25;
      spacing = 2;

      modules-left   = [ "sway/workspaces" "sway/mode" "sway/scratchpad" "custom/media" "sway/window"];
      #modules-center = [ "sway/window" ];
      modules-right  = [ "idle_inhibitor"  "pulseaudio" "network" "cpu" "memory" "temperature" "backlight" "keyboard-state" "sway/language" "battery" "battery#bat2" "clock" "custom/weather" "custom/notification" "tray" ];

      "sway/workspaces" = {
        all-outputs = true;
        format = "{name}{icon}";
        format-icons = {
          "urgent" = "";
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
          "activated" = "AWK";
          "deactivated" = "SLP";
        };
      };

      tray = {
          # icon-size = 21;
          spacing = 10;
        };

        "custom/weather" = {
          format = "{}°";
          tooltip=  true;
          interval= 3600;
          exec= "wttrbar --lang pt --location ponta-grossa";
          return-type= "json";
        };

        clock = {
          timezone = lib.mkDefault "America/Sao_Paulo";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format = "{:%T %d/%m/%Y}";
          interval = 1;
        };

        cpu = {
          format = "{avg_frequency} GHz";
          tooltip = false;
        };

        memory = {
          format = "{used} GiB";
        };

        temperature = {
          critical-threshold = 80;
          format = "{temperatureC}°C";
        };

        backlight = {
          # "device" = "acpi_video1";
          format = "{percent}/100";
        };

        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {power}W";
          format-charging = "{capacity}%^ {power}W";
          format-plugged = "{capacity}%^ {power}W";
          format-alt = "{time}";
        };

        "battery#bat2" = {
          bat = "BAT2";
        };

        "sway/language" = {
          format = "{variant}";
          on-click = "swaymsg input type:keyboard xkb_switch_layout next";
        };

        network = {
          format-wifi = "{essid} ({signalStrength}%)";
          format-ethernet = "{ifname}";
          tooltip-format = "{ifname} via {gwaddr} at {ipaddr} ETH";
          format-linked = "{ifname} (No IP)";
          format-disconnected = "Disconnected";
        };

        pulseaudio = {
          scroll-step = 1;
          format = "{icon}:{volume}%  {format_source}";
          format-bluetooth = "{icon}:{volume}%  {format_source}";
          format-bluetooth-muted = "{icon}:-%  {format_source}";
          format-muted = "VOL:-% {format_source}";
          format-source = "MIC:{volume}%";
          format-source-muted = "MIC:-%";
          format-icons = {
            headphone = "HP";
            hands-free = "HF";
            headset = "HS";
            phone = "PH";
            portable = "PO";
            car = "CAR";
            default = ["VOL" "VOL" "VOL"];
          };
          on-click = "pavucontrol-qt";
        };

      "custom/notification"= {
        "tooltip"= false;
        "format"= "{icon}";
        "format-icons"= {
          "notification"= "<span foreground='red'><sup></sup></span>";
          "none"= "";
          "dnd-notification"= "<span foreground='red'><sup></sup></span>";
          "dnd-none"= "";
          "inhibited-notification"= "<span foreground='red'><sup></sup></span>";
          "inhibited-none"= "";
          "dnd-inhibited-notification"= "<span foreground='red'><sup></sup></span>";
          "dnd-inhibited-none"= "";
        };
        "return-type"= "json";
        "exec-if"= "which swaync-client";
        "exec"= "${pkgs.swaynotificationcenter}/bin/swaync-client -swb";
        "on-click"= "${pkgs.swaynotificationcenter}/bin/swaync-client -t -sw";
        "on-click-right"= "${pkgs.swaynotificationcenter}/bin/swaync-client -d -sw";
        "escape"= true;
      };
    }];

    style = ''
    * {
      font-family: terminus;
      font-size: 18px;
      border-radius: 0px;
      transition-duration: 0;
    }

    window#waybar { 
      background: rgba(50,48,47,0.9);
      color: #FBF1C7;
      border-radius: 0px;
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

    button {
      box-shadow: inset 0 -3px transparent;
      border: none;
      border-radius: 0;
      min-height: 24px;
      min-width: 16px;
    }

    /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
    button:hover {
      background: inherit;
      /*box-shadow: inset 0 -3px #ffffff;*/
    }

      #workspaces button {
        padding: 0 5px;
        background-color: transparent;
        color: #A89984;
        border-radius: 0%;
        transition-duration: .2s;
      }

      #workspaces button:hover {
        color: #FBF1C7;
      }

      #workspaces button.focused {
        color: #FBF1C7;
      }

      #workspaces button.urgent {
        color: #CC241D;
      }

      #mode {
        background-color: #64727D;
        border-bottom: 3px solid #ffffff;
      }

      #custom-notification,
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
      #custom-weather,
      #mode,
      #idle_inhibitor,
      #scratchpad,
      #language,
      #mpd  {
        padding: 0 2px;
        border-right: 1px solid #FBF1C7; 
      }

      #tray {
        padding: 0 2px;
        border-right: 0; 
      }

      #window,
      #workspaces {
        margin: 0 4px;
      }

      #waybar.empty #window {
        border: none;
        background: none;
      }


      #battery.charging, #battery.plugged {
        color: #00ff00;
      }

      #temperature.critical,
      #wireplumber.muted,
      #battery.critical:not(.charging),
      #network.disconnected,
      #pulseaudio.muted {
        color: #ff0000;
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
