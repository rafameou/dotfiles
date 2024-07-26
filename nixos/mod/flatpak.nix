{ inputs, pkgs, ... }:
{
  imports = [
    inputs.nix-flatpak.nixosModules.nix-flatpak
  ];
  /* maybe we should move this to home-manager in the future */
  services.flatpak = {
    enable = true;
    overrides = {
      global = {
        /*Force Wayland by default*/
        Context = {
          /* ln -s /run/current-system/sw/share/X11/fonts ~/.local/share/fonts */
          filesystems = [
            "$HOME/.local/share/fonts:ro"
            "$HOME/.icons:ro"
          ];
          sockets = ["wayland" "x11" "fallback-x11"];
        };

        Environment = {
          /*Fix un-themed cursor in some Wayland apps*/
          XCURSOR_PATH = "/run/host/user-share/icons:/run/host/share/icons";
        }; 
      };
    };
    update.auto = {
      enable = true;
      onCalendar = "weekly"; # Default value
    };
    packages = [
      "com.github.tchx84.Flatseal"
      "dev.bambosh.UnofficialHomestuckCollection"
      "io.github.finefindus.Hieroglyphic"
      "org.gnome.gitlab.YaLTeR.VideoTrimmer"
      "org.gnome.gitlab.YaLTeR.Identity"
      "io.mrarm.mcpelauncher"
    ];
  };

  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-kde ];
    config.common.default = "*";
  };
}
