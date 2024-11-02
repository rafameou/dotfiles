{ config, inputs, ... }:
{
  imports = [ ../../nix-colors.nix ];
  programs.zathura = {
    enable = true;
    options = {
      recolor = true;
      recolor-keephue = true;
      /*----------------------------------|
      |- Stolen from Misterio77's config -|
      |----------------------------------*/
      #https://github.com/Misterio77/nix-colors/issues/41
      default-bg = "rgba(${inputs.nix-colors.lib.conversions.hexToRGBString "," config.colorScheme.palette.base00}, 0.9)";#"#${config.colorScheme.palette.base00}";
      default-fg = "#${config.colorScheme.palette.base01}";
      statusbar-bg = "#${config.colorScheme.palette.base02}";
      statusbar-fg = "#${config.colorScheme.palette.base04}";
      inputbar-bg = "#${config.colorScheme.palette.base00}";
      inputbar-fg = "#${config.colorScheme.palette.base07}";
      notification-bg = "#${config.colorScheme.palette.base00}";
      notification-fg = "#${config.colorScheme.palette.base07}";
      notification-error-bg = "#${config.colorScheme.palette.base00}";
      notification-error-fg = "#${config.colorScheme.palette.base08}";
      notification-warning-bg = "#${config.colorScheme.palette.base00}";
      notification-warning-fg = "#${config.colorScheme.palette.base08}";
      highlight-color = "#${config.colorScheme.palette.base0A}";
      highlight-active-color = "#${config.colorScheme.palette.base0D}";
      completion-bg = "#${config.colorScheme.palette.base01}";
      completion-fg = "#${config.colorScheme.palette.base05}";
      #completions-highlight-bg = "#${config.colorScheme.palette.base0D}";
      #completions-highlight-fg = "#${config.colorScheme.palette.base07}";
      recolor-lightcolor = "rgba(${inputs.nix-colors.lib.conversions.hexToRGBString "," config.colorScheme.palette.base00}, 0.0)";#"#${config.colorScheme.palette.base00}";
      recolor-darkcolor = "#${config.colorScheme.palette.base06}";
    };
  };
}
