{ config, pkgs, ... }:
let
  autostartString = (val: ''
      [Desktop Entry]
      Type=Application
      Exec=${val}
      Hidden=false
      Name=${val}
      X-MATE-Autostart-Delay=2
  '');
in
  {
    home.packages = with pkgs; [
      gnome.dconf-editor
      mate.mate-tweak
      mate.mate-icon-theme-faenza
      networkmanagerapplet
      blueman

      arc-theme
      arc-icon-theme
      cinnamon.mint-themes
      mate.mate-icon-theme-faenza
      cinnamon.mint-x-icons

      kdePackages.oxygen
      kdePackages.oxygen.qt5
      kdePackages.oxygen-sounds
      kdePackages.oxygen-icons

      xclip

      volctl
    ];

    dconf.settings = {
      "org/mate/panel/menubar" = {
        show-icon = true;
        icon-name = "nix-snowflake";
      };
      "org/mate/panel/objects/clock/prefs" = {
        show-seconds = true;
      };
      "org/mate/panel/toplevels/top/background" = {
      #image = "/home/rafameou/GoogleDrive/Outros/Temas/Ubuntu Panel BG 32.png";
      type = "none";#"image";
    };
    "org/mate/panel/toplevels/bottom/background" = {
      #image = "/home/rafameou/GoogleDrive/Outros/Temas/Ubuntu Panel BG 32.png";
      type = "none";#"image";
    };
    "org/mate/desktop/background" = {
      picture-filename = config.stylix.image;
    };
    "org/mate/desktop/interface" = with config.stylix.fonts; {
      gtk-theme = "TraditionalOk";#"adw-gtk3";
      icon-theme = "mate";
      font-name = "${sansSerif.name} ${toString (sizes.applications - 1)}";
      document-font-name = "${serif.name}  ${toString (sizes.applications - 1)}";
      monospace-font-name = "${monospace.name} ${toString sizes.applications}";
    };
    "org/mate/marco/general" = {
      theme = "Dopple";
      titlebar-uses-sytem-font = true;
    };
    "org/mate/terminal/profiles/default" = with config.lib.stylix.colors.withHashtag; {
      background-color = base00;
      background-darkness = config.stylix.opacity.terminal;
      background-type = "transparent";
      foreground-color = base05;
      palette = "${base00}:${red}:${green}:${yellow}:${blue}:${magenta}:${cyan}:${base05}:${base03}:${bright-red}:${bright-green}:${yellow}:${bright-blue}:${bright-cyan}:${base06}";
      use-theme-colors = false;
      use-system-font = true;
    };
    "org/mate/marco/keybinding-commands" = {
      command-screenshot = "mate-screenshot -ac";
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

      move-to-workspace-1 = "<Mod4><Shift>1";
      move-to-workspace-2 = "<Mod4><Shift>2";
      move-to-workspace-3 = "<Mod4><Shift>3";
      move-to-workspace-4 = "<Mod4><Shift>4";
      move-to-workspace-5 = "<Mod4><Shift>5";
      move-to-workspace-6 = "<Mod4><Shift>6";
      move-to-workspace-7 = "<Mod4><Shift>7";
      move-to-workspace-8 = "<Mod4><Shift>8";
      move-to-workspace-9 = "<Mod4><Shift>9";
    };

    # --- fix for volume icon disappearing --- (doesnt work -.-)
    /*"org/mate/settings-daemon/plugins/media-keys" = {
    active = true;
    enable-osd = true;
    volume-step = 5;
    volume-down = "XF86AudioLowerVolume";
    volume-up = "XF86AudioRaiseVolume";
    };*/

    # --- other ---
    "apps/volctl" = {
      mixer-command = "pavucontrol";
      mouse-wheel-step = 5;
      osd-position = "bottom-center";
      show-percentage = true;
    };
  };

  xdg.configFile = {
    /*
    Hey, rafameou from the past here.
    Hidden means it's on or off, false means on.
    */
    "autostart/betterbird.desktop".text = autostartString "betterbird";
    "autostart/gammastep-indicator.desktop".text = autostartString "gammastep-indicator";
    "autostart/trayscale.desktop".text = autostartString "trayscale --hide-window";
    "autostart/volctl.desktop".text = autostartString "volctl";
  };
}
