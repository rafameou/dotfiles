{...}:
{
  programs.i3status-rust = {
    enable = true;
    bars = {
      bottom = {
        theme = "gruvbox-dark";#"gruvbox-dark";
        icons = "material-nf";
        blocks = [
          /*{ block = "focused_window"; }*/
          { block = "music"; }
          {
            block = "sound";
            click = [
              {
                button = "left";
                cmd = "pavucontrol-qt";
              }
            ];
          }
          {
            block = "privacy";
            driver = [
              {
                name = "v4l";
              }
              /*{
                name = "pipewire";
              }*/
            ];
          }
          {
            block = "kdeconnect";
          }
          /*{
            block = "temperature";
            interval = 10;
            format = " $icon $max" ;
            inputs = ["Core 0" "CPU"];
            chip = "*-isa-*";
          }*/
          { block = "disk_space"; }
          /*{ 
            block = "memory"; 
            format = " $icon $mem_used_percents.eng(w:2) ";
            format_alt = " $icon $mem_used.eng(prefix:Mi)/$mem_total.eng(prefix:Mi)($mem_used_percents.eng(w:2)) $icon_swap $swap_used_percents.eng(w:2) ";
          }
          { block = "cpu"; }*/
          { 
            block = "net";
            format = " $icon {$ssid($signal_strength) $frequency|Wired}";
            format_alt = " $icon {$ssid($signal_strength $frequency)|Wired} via $device ";
            interval = 10;
          }
          { block = "backlight"; }
          {
            block = "hueshift";
            step = 0;
          }
          { 
            block = "keyboard_layout"; 
            driver = "sway";
            format = " $variant ";
          }
          /*{
          block = "toggle";
          format = " LOCK $icon ";
          command_state = ''[[ $(systemctl --user is-active swayidle) == "active" ]] && echo "ok" || echo ""'';
          command_on = "systemctl --user start swayidle";
          command_off = "systemctl --user stop swayidle";
          }*/
          /*{ 
            block = "notify"; 
            format = " NOT $icon ";
          }*/
          { block = "battery"; }
          { 
            block = "time"; 
            interval = 10;
            format = {
              full = " $icon $timestamp.datetime(f:'%a %d/%m %R:%S', l:pt_BR) ";
              short = " $icon $timestamp.datetime(f:%R) ";
            };
          }
        ];
      };
    };
  }; 
}
