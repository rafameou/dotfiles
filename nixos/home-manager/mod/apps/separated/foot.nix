{ config, ... }:
{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "FiraCode Nerd Font Mono:size=16";
      };
      /*
        csd = {
          preferred = "none";
        };
      */
      colors = {
        alpha = "1";
        foreground = "${config.colorScheme.palette.base05}";
        background = "${config.colorScheme.palette.base00}";
        regular0 = "${config.colorScheme.palette.base00}";
        regular1 = "${config.colorScheme.palette.base08}";
        regular2 = "${config.colorScheme.palette.base0B}";
        regular3 = "${config.colorScheme.palette.base0A}";
        regular4 = "${config.colorScheme.palette.base0D}";
        regular5 = "${config.colorScheme.palette.base0E}";
        regular6 = "${config.colorScheme.palette.base0C}";
        regular7 = "${config.colorScheme.palette.base05}";
        bright0 = "${config.colorScheme.palette.base03}";
        bright1 = "${config.colorScheme.palette.base08}";
        bright2 = "${config.colorScheme.palette.base0B}";
        bright3 = "${config.colorScheme.palette.base0A}";
        bright4 = "${config.colorScheme.palette.base0D}";
        bright5 = "${config.colorScheme.palette.base0E}";
        bright6 = "${config.colorScheme.palette.base0C}";
        bright7 = "${config.colorScheme.palette.base07}";
        "16" = "${config.colorScheme.palette.base09}";
        "17" = "${config.colorScheme.palette.base0F}";
        "18" = "${config.colorScheme.palette.base01}";
        "19" = "${config.colorScheme.palette.base02}";
        "20" = "${config.colorScheme.palette.base04}";
        "21" = "${config.colorScheme.palette.base06}";
      };
    };
  };
}
