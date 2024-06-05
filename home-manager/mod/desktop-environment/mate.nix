{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    gnome.dconf-editor
    mate.mate-tweak
    mate.mate-icon-theme-faenza
    networkmanagerapplet

    arc-theme
    arc-icon-theme
    cinnamon.mint-themes
    mate.mate-icon-theme-faenza
    cinnamon.mint-x-icons

    xclip
  ];

  dconf.settings = {
    "org/mate/panel/menubar" = {
      show-icon = true;
      icon-name = "nix-snowflake";
    };
    "org/mate/panel/objects/clock/prefs" = {
      show-seconds = true;
    };
    "org/mate/desktop/background" = {
      picture-filename = config.stylix.image;
    };
    "org/mate/desktop/interface" = with config.stylix.fonts; {
      gtk-theme = "adw-gtk3";
      icon-theme = "Arc";
      font-name = "${sansSerif.name} ${toString (sizes.applications - 1)}";
      document-font-name = "${serif.name}  ${toString (sizes.applications - 1)}";
      monospace-font-name = "${monospace.name} ${toString sizes.applications}";
    };
    "org/mate/marco/general" = {
      theme = "Spidey";
      titlebar-uses-sytem-font = true;
    };
    # --- shortcuts --- #
    "org/mate/marco/global-keybindings" = {
      panel-run-dialog = "<Mod4>d";
      switch-to-workspace-1 = "<Mod4>1";
      switch-to-workspace-2 = "<Mod4>2";
      switch-to-workspace-3 = "<Mod4>3";
      switch-to-workspace-4 = "<Mod4>4";
      switch-to-workspace-5 = "<Mod4>5";
      switch-to-workspace-6 = "<Mod4>6";
      switch-to-workspace-7 = "<Mod4>7";
      switch-to-workspace-8 = "<Mod4>8";
      switch-to-workspace-9 = "<Mod4>9";
    };
    "org/mate/marco/window-keybindings" = {
      close = "<Shift><Mod4>q";
      maximize = "<Mod4>Up";
      unmaximize = "<Mod4>Down";
      tile-to-side-e = "<Mod4>Right";
      tile-to-side-w = "<Mod4>Left";
    };
    "org/mate/marco/keybinding-commands" = {
      command-screenshot = "mate-screenshot -ac";
    };
  };
}
