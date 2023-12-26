{configs, pkgs, lib, ...}:
{
  programs.waybar = {
    enable = true;
    settings = [{
      layer = "bottom";
      position = "bottom";
      height = 25;
      spacing = 5;

      modules-left   = [ "sway/workspaces" "sway/mode" "sway/scratchpad" "custom/media" "sway/window"];
      /*modules-center = [ "sway/window" ];*/
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
        /* icon-size = 21;*/
        spacing = 10;
      };

      clock = {
        timezone = lib.mkDefault "America/Sao_Paulo";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format = "{:%T %d/%m/%Y}";
        interval = 1;
      };

      cpu = {
        format = ":{usage}%";
        tooltip = false;
      };

      memory = {
        format = ":{}%";
      };

      temperature = {
        /* "thermal-zone" = 2;
        "hwmon-path" = "/sys/class/hwmon/hwmon2/temp1_input";*/
        critical-threshold = 80;
        /* "format-critical" = "{temperatureC}°C {icon}";*/
        format = "{icon}:{temperatureC}°C";
        format-icons = ["" "" ""];
      };

      backlight = {
        format = "{icon}:{percent}%";
        format-icons = ["" "" "" "" "" "" "" "" ""];
      };

      battery = {
        states = {
          good = 95;
          warning = 30;
          critical = 15;
        };
        format = "{icon}:{capacity}% ";
        format-charging = ":{capacity}% ";
        format-plugged = ">{capacity}% ";
        format-alt = "{icon}:{time} ";
        format-icons = ["" "" "" "" ""];
      };

      "battery#bat2" = {
        bat = "BAT2";
      };


      network = {
        format-wifi = ":{essid}({signalStrength}%)";
        format-ethernet = ":{ipaddr}";
        tooltip-format = "{ifname} via {gwaddr} at {ipaddr} ";
        format-linked = ":{ifname}(No IP)";
        format-disconnected = "⚠:Disconnected";
      };

      pulseaudio = {
        scroll-step = 1;
        format = "{icon}:{volume}%  {format_source}";
        format-bluetooth = "{icon}:{volume}%   {format_source}";
        format-bluetooth-muted = " {icon}  {format_source}";
        format-muted = "   {format_source}";
        format-source = ":{volume}%";
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
    /*change the import thing to an overlay or smth */
    style = ''
      @import "${(pkgs.catppuccin.override {
        accent = "green";
        variant = "frappe";
        themeList = ["waybar"];
      })}/waybar/frappe.css";
      * {
      /* `otf-font-awesome` is required to be installed for icons */
      font-family: Inter, "Font Awesome 6 Free";
      font-size: 12px;
      }

      window#waybar {
        background: @base;
      /*dark*/
      /*background: linear-gradient(180deg, alpha(@base, 0.75) 0%, @base 100%);*/ 
      /*white*/
      /*background: linear-gradient(180deg, alpha(@base, 1) 0%, alpha(@base, 0.50) 100%);*/
      color: @text;
      /*transition-property: background-color;
      transition-duration: .5s;*/
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
                  min-width: 0;
                  }

                  /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
                  button:hover {
                  background: inherit;
                  /*box-shadow: inset 0 -3px #ffffff;*/
                  }

#workspaces button {
                  padding: 0px 5px;
                  /*margin: 0px 5px;*/
                  background-color: transparent;
                  color: alpha(@text, 0.5);
                  border-radius: 0%;
                  }

#workspaces button:hover {
                  color: shade(@green, 0.5);
                  }

#workspaces button.focused {
                  color: @green;
                  }

#workspaces button.urgent {
                  color: @red;
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

                  /* If workspaces is the leftmost module, omit left margin */
                  .modules-left > widget:first-child > #workspaces {
                  margin-left: 0;
                  }

                  /* If workspaces is the rightmost module, omit right margin */
                  .modules-right > widget:last-child > #workspaces {
                  margin-right: 0;
                  }

                  .modules-right {
                  color: @text;
                  padding: 2px 2px; /* 0 10 */
                  }

#temperature.critical,
#network.disconnected,
#pulseaudio.muted,
#battery.critical:not(.charging) {
                    color: @green;
                    }

#tray > .passive {
                    -gtk-icon-effect: dim;
                    }

#tray > .needs-attention {
                    -gtk-icon-effect: highlight;
                    }
    '';
  };
}
