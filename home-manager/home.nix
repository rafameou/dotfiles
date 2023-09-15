# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ inputs, lib, config, pkgs, ... }: 
{
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
    ./mod/gnome.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

  home = {
    username = "rafameou";
    homeDirectory = "/home/rafameou";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = with pkgs; [
    # ---- internet ----
    vivaldi
    google-chrome
    thunderbird
    tdesktop
    (discord.override { nss = nss_latest; })
    spotify
    bitwarden
    # ---- edit ----
    gimp
    onlyoffice-bin
    libreoffice
    hunspell
    hunspellDicts.pt_BR
    strawberry
    celluloid #mpv
    (texlive.combine {inherit (texlive) scheme-small abnt abntex2 collection-langportuguese dvipng;})
    cherrytree
    texstudio
    # ---- utils ----
    flatpak
    github-desktop
    geogebra
    octaveFull
    nicotine-plus
    qbittorrent
    neovim
    unar
    unzip
    zip
    xsane
    htop
    # ---- games ----
    easyrpg-player
    # ---- extra ----
    nixos-icons
    mesa-demos
  ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  #programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
   
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
