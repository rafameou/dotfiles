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
      foreground = "#${config.colorScheme.colors.base05}";
      background = "#${config.colorScheme.colors.base00}";
      selection_background = "#${config.colorScheme.colors.base05}";
      selection_foreground = "#${config.colorScheme.colors.base00}";
      url_color = "#${config.colorScheme.colors.base04}";
      cursor = "#${config.colorScheme.colors.base05}";
      active_border_color = "#${config.colorScheme.colors.base03}";
      inactive_border_color = "#${config.colorScheme.colors.base01}";
      active_tab_background = "#${config.colorScheme.colors.base00}";
      active_tab_foreground = "#${config.colorScheme.colors.base05}";
      inactive_tab_background = "#${config.colorScheme.colors.base01}";
      inactive_tab_foreground = "#${config.colorScheme.colors.base04}";
      tab_bar_background = "#${config.colorScheme.colors.base01}";
      color0 = "#${config.colorScheme.colors.base00}";
      color1 = "#${config.colorScheme.colors.base08}";
      color2 = "#${config.colorScheme.colors.base0B}";
      color3 = "#${config.colorScheme.colors.base0A}";
      color4 = "#${config.colorScheme.colors.base0D}";
      color5 = "#${config.colorScheme.colors.base0E}";
      color6 = "#${config.colorScheme.colors.base0C}";
      color7 = "#${config.colorScheme.colors.base05}";
      color8 = "#${config.colorScheme.colors.base03}";
      color9 = "#${config.colorScheme.colors.base08}";
      color10 = "#${config.colorScheme.colors.base0B}";
      color11 = "#${config.colorScheme.colors.base0A}";
      color12 = "#${config.colorScheme.colors.base0D}";
      color13 = "#${config.colorScheme.colors.base0E}";
      color14 = "#${config.colorScheme.colors.base0C}";
      color15 = "#${config.colorScheme.colors.base07}";
      color16 = "#${config.colorScheme.colors.base09}";
      color17 = "#${config.colorScheme.colors.base0F}";
      color18 = "#${config.colorScheme.colors.base01}";
      color19 = "#${config.colorScheme.colors.base02}";
      color20 = "#${config.colorScheme.colors.base04}";
      color21 = "#${config.colorScheme.colors.base06}";
    };
  };
}
