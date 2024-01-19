{ inputs, lib, config, pkgs, ... }:
{
  imports = [ ../nix-colors.nix ];
  programs.zathura = {
    enable = true;
    options = {
      recolor = true;
      /*----------------------------------|
      |- Stolen from Misterio77's config -|
      |----------------------------------*/
      default-bg = "#${config.colorScheme.colors.base00}";
      default-fg = "#${config.colorScheme.colors.base01}";
      statusbar-bg = "#${config.colorScheme.colors.base02}";
      statusbar-fg = "#${config.colorScheme.colors.base04}";
      inputbar-bg = "#${config.colorScheme.colors.base00}";
      inputbar-fg = "#${config.colorScheme.colors.base07}";
      notification-bg = "#${config.colorScheme.colors.base00}";
      notification-fg = "#${config.colorScheme.colors.base07}";
      notification-error-bg = "#${config.colorScheme.colors.base00}";
      notification-error-fg = "#${config.colorScheme.colors.base08}";
      notification-warning-bg = "#${config.colorScheme.colors.base00}";
      notification-warning-fg = "#${config.colorScheme.colors.base08}";
      highlight-color = "#${config.colorScheme.colors.base0A}";
      highlight-active-color = "#${config.colorScheme.colors.base0D}";
      completion-bg = "#${config.colorScheme.colors.base01}";
      completion-fg = "#${config.colorScheme.colors.base05}";
      completions-highlight-bg = "#${config.colorScheme.colors.base0D}";
      completions-highlight-fg = "#${config.colorScheme.colors.base07}";
      recolor-lightcolor = "#${config.colorScheme.colors.base00}";
      recolor-darkcolor = "#${config.colorScheme.colors.base06}";
    };
  };
}
