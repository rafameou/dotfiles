{ inputs, lib, config, pkgs, ... }:
{
  imports = [ ../nix-colors.nix ];
  services.dunst = {
    enable = true;
    settings = {
      /*https://github.com/tinted-theming/base16-dunst/*/
      global = {
        frame_color = "#${config.colorScheme.colors.base05}";
        separator_color = "#${config.colorScheme.colors.base05}";
      };
      urgency_low = {
        background = "#${config.colorScheme.colors.base01}";
        foreground = "#${config.colorScheme.colors.base03}";
      };
      urgency_normal = {
        background = "#${config.colorScheme.colors.base02}";
        foreground = "#${config.colorScheme.colors.base05}";
      };
      urgency_critical = {
        background = "#${config.colorScheme.colors.base08}";
        foreground = "#${config.colorScheme.colors.base06}";
      };
    };
  };
}
