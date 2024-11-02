{ config, ... }:
{
  imports = [ ../../nix-colors.nix ];
  services.dunst = {
    enable = true;
    settings = {
      /*https://github.com/tinted-theming/base16-dunst/*/
      global = {
        frame_color = "#${config.colorScheme.palette.base05}";
        separator_color = "#${config.colorScheme.palette.base05}";
      };
      urgency_low = {
        background = "#${config.colorScheme.palette.base01}";
        foreground = "#${config.colorScheme.palette.base03}";
      };
      urgency_normal = {
        background = "#${config.colorScheme.palette.base02}";
        foreground = "#${config.colorScheme.palette.base05}";
      };
      urgency_critical = {
        background = "#${config.colorScheme.palette.base08}";
        foreground = "#${config.colorScheme.palette.base06}";
      };
    };
  };
}
