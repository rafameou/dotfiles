{configs, pkgs, lib, ...}:
{
  programs.waybar = {
    enable = true;
    settings = [{
      layer = "bottom";
      position = "bottom";
      height = 25;
      spacing = 5;

      modules-left   = [ "sway/workspaces" "sway/mode" "custom/media" "sway/window"];
      modules-center = [ "clock" "idle_inhibitor" ];
      modules-right  = [ "pulseaudio" "network" "cpu" "memory" "backlight" "sway/language" "battery" "battery#bat2" "tray" ];

      "sway/workspaces" = {
        all-outputs = true;
        format = "{name}{icon}";
        format-icons = {
          "urgent" = "!";
          "focused" = "";
          "default" = "";
        };
      };

      /*"sway/window" = {
      icon = true;
      icon-size = 16;
      };*/

      idle_inhibitor = {
        format = "{icon}";
        format-icons = {
          "activated" = "o-o";
          "deactivated" = "zzz";
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
        format = "CPU:{usage}%";
        tooltip = false;
      };

      memory = {
        format = "RAM:{}%";
      };

      backlight = {
        format = "BL:{percent}%";
      };

      battery = {
        states = {
          good = 95;
          warning = 30;
          critical = 15;
        };
        format = "BAT:{capacity}%";
        format-charging = "BAT:+{capacity}%";
        format-plugged = "BAT:~{capacity}%";
        format-alt = "BAT:{time}";
      };

      "battery#bat2" = {
        bat = "BAT2";
      };


      network = {
        format-wifi = "W:{essid}({signalStrength}%)";
        format-ethernet = "E:{ipaddr}";
        tooltip-format = "{ifname} via {gwaddr} at {ipaddr}";
        format-linked = "E:{ifname}(No IP)";
        format-disconnected = "W:N/A";
      };

      pulseaudio = {
        scroll-step = 1;
        format = "VOL:{volume}% {format_source}";
        format-bluetooth = "VOL:{volume}% BT {format_source}";
        format-bluetooth-muted = "VOL:0% BT {format_source}";
        format-muted = "VOL:0% {format_source}";
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
                    color: @red;
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
