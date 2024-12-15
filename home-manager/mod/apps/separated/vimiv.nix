{ config, pkgs, ... }:
{
  home.packages = with pkgs; [ vimiv-qt ];
  xdg.configFile = {
    "vimiv/styles/nix-colors".text = ''
      ; base16: (https://github.com/chriskempson/base16)
      ; Template: Christian Karl <karlch at protonmail dot com>

      [STYLE]
      ; Colors
      base00 = #${config.colorScheme.palette.base00}
      base01 = #${config.colorScheme.palette.base01}
      base02 = #${config.colorScheme.palette.base02}
      base03 = #${config.colorScheme.palette.base03}
      base04 = #${config.colorScheme.palette.base04}
      base05 = #${config.colorScheme.palette.base05}
      base06 = #${config.colorScheme.palette.base06}
      base07 = #${config.colorScheme.palette.base07}
      base08 = #${config.colorScheme.palette.base08}
      base09 = #${config.colorScheme.palette.base09}
      base0a = #${config.colorScheme.palette.base0A}
      base0b = #${config.colorScheme.palette.base0B}
      base0c = #${config.colorScheme.palette.base0C}
      base0d = #${config.colorScheme.palette.base0D}
      base0e = #${config.colorScheme.palette.base0E}
      base0f = #${config.colorScheme.palette.base0F}

      ; Additional custom overrides, e.g.
      font = 12pt Fira Sans
      ; thumbnail.padding = 32

      ; vim:ft=dosini
    '';

    "vimiv/vimiv.conf".text = ''
      [GENERAL]
      style = nix-colors
      read_only = True
      [STATUSBAR]
      center = {image-size} 
    '';
  };
}
