{configs, pkgs, lib, ...}:
{
  programs.waybar = {
    enable = true;
    settings = [{
      layer = "bottom";
      position = "top";
      height = 24;
      spacing = 5;

      modules-left   = [ "sway/workspaces" "sway/mode"];
      modules-center = [  ];
      modules-right  = [ "sway/window" "pulseaudio" "network" "memory" "cpu" "backlight" "sway/language" "battery" "battery#bat2" "idle_inhibitor" "clock" "tray" ];

      "sway/workspaces" = {
        disable-scroll-wraparound = true;
        all-outputs = true;
        format = "{name}{icon}";
        format-icons = {
          urgent = "";
          focused = "";
          default = "";
          persistent = "~";
        };
      };

      "sway/window" = {
        format = "[{title}]";
        tooltip-format = "{shell} - {app_id}";
      };

      "sway/language" = {
        format = "[{flag}{variant}]";
        on-click = "swaymsg input type:keyboard xkb_switch_layout next";
      };

      idle_inhibitor = {
        format = "{icon}";
        format-icons = {
          "activated" = "[o-o]";
          "deactivated" = "[zzz]";
        };
      };

      tray = {
        icon-size = 16;
        spacing = 5;
      };

      clock = {
        timezone = lib.mkDefault "America/Sao_Paulo";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format = "[{:%T %d/%m/%Y}]";
        interval = 1;
      };

      cpu = {
        format = "[CPU:{usage}%]";
        tooltip = false;
      };

      memory = {
        format = "[RAM:{}%]";
        format-alt = "[RAM:{used}]";
      };

      backlight = {
        format = "[BL:{percent}%]";
      };

      battery = {
        states = {
          good = 95;
          warning = 30;
          critical = 15;
        };
        format = "[BAT:{capacity}%]";
        format-charging = "[BAT:+{capacity}%]";
        format-plugged = "[BAT:~{capacity}%]";
        format-alt = "[BAT:{time}]";
      };

      "battery#bat2" = {
        bat = "BAT2";
      };


      network = {
        format-wifi = "[W:{essid}({signalStrength}%)]";
        format-ethernet = "[E:{ipaddr}]";
        tooltip-format = "[{ifname} via {gwaddr} at {ipaddr}]";
        format-linked = "[E:{ifname}(No IP)]";
        format-disconnected = "[W:N/A]";
      };

      pulseaudio = {
        scroll-step = 1;
        format = "[VOL:{volume}% {format_source}]";
        format-bluetooth = "[VOL:{volume}% BT {format_source}]";
        format-bluetooth-muted = "[VOL:0% BT {format_source}]";
        format-muted = "[VOL:0% {format_source}]";
        format-source = "MIC:{volume}%";
        format-source-muted = "MIC:0%";
        on-click = "pavucontrol-qt";
      };
    }];
    /*change the import thing to an overlay or smth */
    style = ''
    @import "${(pkgs.catppuccin.override {
        accent = "green";
        variant = "frappe";
        themeList = ["waybar"];
      })}/waybar/frappe.css";
    * {
      font-family: Inter;
      font-size: 12px;
    }

    window#waybar {
      background: @base;
      color: @text;
    }

    button {
      box-shadow: inset 0 -3px transparent;
      border: none;
      border-radius: 0;
      min-width: 0;
    }

    #workspaces button {
      padding: 0px 10px; 
      border: none;
      border-radius: 0%;
    }

    #battery.charging,
    #idle_inhibitor.activated,
    #workspaces button.focused {
      background: alpha(@green, 0.5);
      color: rgb(255,255,255);
    }

    #workspaces button.urgent,
    #temperature.critical,
    #network.disconnected,
    #pulseaudio.muted,
    #battery.critical:not(.charging) {
      background: alpha(@red, 0.5);
      color: rgb(255,255,255);
    }
    '';
  };
}
