{ config, ... }:
{
  imports = [ ../../nix-colors.nix ];
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        icon-theme = "hicolor";
        font = "CozetteVector";
        line-height = 16;
      };
      colors = {
        background = "${config.colorScheme.palette.base00}ff";#7d";#e6";
        text = "${config.colorScheme.palette.base05}ff";
        match = "${config.colorScheme.palette.base0D}ff";
        selection = "${config.colorScheme.palette.base03}ff";
        selection-text = "${config.colorScheme.palette.base06}ff";
        selection-match = "${config.colorScheme.palette.base0D}ff";
        border = "${config.colorScheme.palette.base05}ff";
      };
      border = {
        width = 1;
        radius = 0;
      };
    };
  }; 
}
