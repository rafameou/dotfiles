{ ... }:
{
  programs.mpv = {
    enable = true;
    config = {
      ytdl-format = "best[height<=1080]";
    };
  };  
}
