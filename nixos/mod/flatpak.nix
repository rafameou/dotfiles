{ inputs, ... }:
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
        Context.sockets = ["wayland" "!x11" "!fallback-x11"];

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
      "info.febvre.Komikku"
      "io.github.finefindus.Hieroglyphic"
    ];
  };
}
