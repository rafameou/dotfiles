{ pkgs, ... }:
{
  imports = [
    #./separated/liferea.nix
    #./separated/luakit.nix
    #./separated/qutebrowser.nix
  ];
  programs = {
    librewolf = {
      enable = true;
      package = pkgs.librewolf;
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
    vesktop
    arrpc
    bitwarden-desktop
    komikku
    kdePackages.tokodon
    #kdePackages.neochat #broken 20-03
    #whatsapp-for-linux
    #stremio
    signal-desktop
    element-desktop

    protonvpn-gui
    #protonmail-bridge
  ];
}
