{ pkgs, ... }:
{
  imports = [
    ./separated/liferea.nix
    ./separated/luakit.nix
    ./separated/qutebrowser.nix
  ];
  programs = {
    librewolf = {
      enable = true; 
      settings = {
        "webgl.disabled" = false;
        #"privacy.resistFingerprinting" = false;
        "privacy.clearOnShutdown.history" = false;
        "privacy.clearOnShutdown.cookies" = false;
        "network.cookie.lifetimePolicy" = 0;
        "identity.fxaccounts.enabled" = true;
        "middlemouse.paste" = false;
        "general.autoScroll" = true;
      };
    };
  };

  home.packages = with pkgs; [
    ungoogled-chromium
    telegram-desktop
    bitwarden
    komikku
    #kdePackages.tokodon
    #kdePackages.neochat #broken 21-05
    #whatsapp-for-linux
    stremio

    protonvpn-gui
    #protonmail-bridge
  ];
}
