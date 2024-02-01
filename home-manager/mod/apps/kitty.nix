{ inputs, lib, config, pkgs, ... }:
{
  imports = [ ../nix-colors.nix ];
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    font = {
      name = "FiraCode Nerd Font";
      size = 12;
    };
    /*----------------------------------|
    |- Stolen from Misterio77's config -|
    |----------------------------------*/
    settings = {
      background_opacity = "0.7";
      foreground = "#${config.colorScheme.palette.base05}";
      background = "#${config.colorScheme.palette.base00}";
      selection_background = "#${config.colorScheme.palette.base05}";
      selection_foreground = "#${config.colorScheme.palette.base00}";
      url_color = "#${config.colorScheme.palette.base04}";
      cursor = "#${config.colorScheme.palette.base05}";
      active_border_color = "#${config.colorScheme.palette.base03}";
      inactive_border_color = "#${config.colorScheme.palette.base01}";
      active_tab_background = "#${config.colorScheme.palette.base00}";
      active_tab_foreground = "#${config.colorScheme.palette.base05}";
      inactive_tab_background = "#${config.colorScheme.palette.base01}";
      inactive_tab_foreground = "#${config.colorScheme.palette.base04}";
      tab_bar_background = "#${config.colorScheme.palette.base01}";
      color0 = "#${config.colorScheme.palette.base00}";
      color1 = "#${config.colorScheme.palette.base08}";
      color2 = "#${config.colorScheme.palette.base0B}";
      color3 = "#${config.colorScheme.palette.base0A}";
      color4 = "#${config.colorScheme.palette.base0D}";
      color5 = "#${config.colorScheme.palette.base0E}";
      color6 = "#${config.colorScheme.palette.base0C}";
      color7 = "#${config.colorScheme.palette.base05}";
      color8 = "#${config.colorScheme.palette.base03}";
      color9 = "#${config.colorScheme.palette.base08}";
      color10 = "#${config.colorScheme.palette.base0B}";
      color11 = "#${config.colorScheme.palette.base0A}";
      color12 = "#${config.colorScheme.palette.base0D}";
      color13 = "#${config.colorScheme.palette.base0E}";
      color14 = "#${config.colorScheme.palette.base0C}";
      color15 = "#${config.colorScheme.palette.base07}";
      color16 = "#${config.colorScheme.palette.base09}";
      color17 = "#${config.colorScheme.palette.base0F}";
      color18 = "#${config.colorScheme.palette.base01}";
      color19 = "#${config.colorScheme.palette.base02}";
      color20 = "#${config.colorScheme.palette.base04}";
      color21 = "#${config.colorScheme.palette.base06}";
    };
  };
}
