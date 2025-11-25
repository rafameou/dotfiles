{ pkgs, ... }:
{
  home.packages = with pkgs; [
    arc-theme
    arc-icon-theme
    colloid-gtk-theme
    colloid-icon-theme
    mint-themes
    mint-y-icons
    mint-x-icons
    mint-cursor-themes
    zuki-themes
    greybird
    theme-obsidian2
    iconpack-obsidian
  ];

  qt = {
    enable = true;
    platformTheme.name = "gtk";
  };

  #services.gammastep.enable = true;
  #services.redshift.provider = "geoclue2";

  xfconf.settings = {
    xfce4-session = {
      "general/LockCommand" = "swaylock -Ffk -c 000000";
    };
    xfce4-panel = {
      "/force-all-internal" = true;
    };
  };
}
