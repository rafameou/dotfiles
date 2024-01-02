{configs, pkgs, lib, ...}:
{
   programs.i3status-rust = {
    enable = true;
    bars = {
      top = {
        blocks = [
          {
            block = "sound";
            block.click = {
        button = "left";
        cmd = "pavucontrol-qt";
            };
          }
         {
           block = "time";
           interval = 60;
           format = "%a %d/%m %k:%M %p";
         }
       ];
      };
    };
  }; 
}
