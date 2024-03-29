{ pkgs, ... }:
{
  imports = [
    ./apps/dunst.nix
    ./apps/kitty.nix
    ./apps/neovim.nix
    ./apps/qutebrowser.nix
    #./apps/vscode.nix
    ./apps/zathura.nix
  ]; 
  programs.firefox.enable = true;
  home.packages = with pkgs; [
    /*-------------|
    |-- internet --|
    |-------------*/
    #vivaldi
    google-chrome
    thunderbird
    tdesktop
    #(discord.override { nss = nss_latest; })
    #webcord
    clematis #mpris for discord
    vesktop
    spotify
    /*pkgs.nixpkgs-master.*/bitwarden
    komikku
    libsForQt5.tokodon
    /*---------------| 
    |---   edit   ---| 
    |---------------*/
    gimp
    onlyoffice-bin
    libreoffice
    hunspell
    hunspellDicts.pt_BR
    corefonts
    vistafonts
    strawberry
    mpv
    (texlive.combine {inherit (texlive) scheme-medium abnt abntex2 collection-langportuguese dvipng latexmk todonotes;})
    cherrytree
    kile 
    imagemagick
    ghostscript
    /*okular*/
    qpdfview
    gromit-mpx
    speedcrunch
    notepadqq
    /*---------------|
    |---   util   ---| 
    |---------------*/
    flatpak
    #github-desktop
    gh
    scrcpy
    geogebra
    octaveFull
    nicotine-plus
    qbittorrent
    unar
    unzip
    zip
    xsane
    remmina
    htop
    nixos-icons
    mesa-demos
    /*----------------|
    |---   games   ---|
    |----------------*/
    easyrpg-player
    crispy-doom
    prboom-plus
    prismlauncher
    runelite
    steam #fix steam games: SDL_VIDEODRIVER=x11 prime-run %command% -vulkan
    itch
    heroic
    /*---------------*/
  ];

  xdg.configFile = {
    "Clematis/config.json".text = ''
      {
        "vars": [""], 
        "blacklist": [""], 
        "whitelist": [""], 
        "useIdentifiers": false, 
        "logLevel": "info", 
        "presence": {
                "details": "{title}" 
                "state": "{artist} {album}", 
        },
        "playerPresence": {}
      }
    '';
  }; 
}
