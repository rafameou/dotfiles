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
    #(discord-canary.override { nss = nss_latest; })
    spotify
    bitwarden
    #whatsapp-for-linux
    # ---- edit ----
    gimp
    onlyoffice-bin
    libreoffice
    hunspell
    hunspellDicts.pt_BR
    strawberry
    celluloid
    #mpv
    #haruna
    #texlive.combined.scheme-small
    (texlive.combine {inherit (texlive) scheme-small abnt abntex2 collection-langportuguese dvipng;})
    cherrytree
    texstudio
    # ---- utils ----
    #albert
    gnome.gnome-software
    gnome.gnome-tweaks
    gnome.dconf-editor
    #libsForQt5.discover
    flatpak
    github-desktop
    vscode-with-extensions
    geogebra
    octaveFull
    nicotine-plus
    qbittorrent
    neovim
    #neovim-qt
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
    # ---- gnome extensions ----
    gnomeExtensions.runcat
    gnomeExtensions.appindicator
    gnomeExtensions.openweather
    gnomeExtensions.alphabetical-app-grid
    gnomeExtensions.favourites-in-appgrid 
    gnomeExtensions.todotxt
  ];

  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
        "vivaldi-stable.desktop"
        "google-chrome.desktop"
        "thunderbird.desktop"
        "org.gnome.Nautilus.desktop"
        "cherrytree.desktop"
        "org.telegram.desktop.desktop"
        "discord.desktop"
        "vivaldi-hnpfjngllnobngcgfapefoaidbinmjnm-Default.desktop" #whatsapp
        "vivaldi-akpamiohjfcnimfljfndmaldlcfphjmp-Default.desktop" #instagram
        "vivaldi-jneocipojkkahfcibhjaiilegofacenn-Default.desktop" #duolingo
        "spotify.desktop"
        "bitwarden.desktop"
        "org.gnome.Console.desktop"
        "gnome-system-monitor.desktop"
        "github-desktop.desktop"
      ];
      disable-user-extensions = false;
      enabled-extensions = [
        "runcat@kolesnikov.se"
        "appindicatorsupport@rgcjonas.gmail.com"
        "openweather-extension@jenslody.de"
	"AlphabeticalAppGrid@stuarthayhurst"
	"favourites-in-appgrid@harshadgavali.gitlab.org"
	"todo.txt@bart.libert.gmail.com"
      ];
    };
    "org/gnome/desktop/app-folders" = {
      folder-children = []; #pior implementacao de pasta 2011-2023
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };
    "org/gnome/desktop/interface" = {
      clock-show-seconds = true;
      show-battery-percentage = true;
    };
    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
    };
    "org/gtk/settings/file-chooser" = {
      sort-directories-first = true;
    };
    "org/gtk/gtk4/settings/file-chooser" = {
      sort-directories-first = true;
    };
  };

  qt = {
    enable = true;
    platformTheme = "gnome";
    style.name = "adwaita";
  };

  # Enable home-manager and git
  programs.home-manager.enable = true;
  #programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
   
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
