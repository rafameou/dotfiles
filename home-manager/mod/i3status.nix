{configs, pkgs, lib, ...}:
{
  programs.i3status-rust = {
    enable = true;
    bars = {
      top = {
        theme = "native";
        blocks = [
          { block = "focused_window"; }
          {
            block = "sound";
            click = [
              {
                button = "left";
                cmd = "pavucontrol-qt";
              }
            ];
          }
          { block = "memory"; }
          { block = "cpu"; }
          { block = "backlight"; }
          { block = "keyboard_layout"; }
          { block = "notify"; }
          { block = "battery"; }
          { 
            block = "time"; 
            interval = 10;
            format = {
              full = " $icon $timestamp.datetime(f:'%a %d/%m/%y %R:%S') ";
              short = " $icon $timestamp.datetime(f:%R) ";
            };
          }
        ];
      };
    };
  }; 
}
