{ pkgs, ... }:
{
  imports = [
    #./apps/dunst.nix
    ./apps/foot.nix
    #./apps/fuzzel.nix
    #./apps/kitty.nix
    ./apps/luakit.nix
    ./apps/neovim.nix
    ./apps/qutebrowser.nix
    ./apps/rclone.nix
    ./apps/vimiv.nix
    #./apps/vscode.nix
    ./apps/zathura.nix
  ]; 
  programs.firefox.enable = true;
  home.packages = with pkgs; [
    /*-------------|
    |-- internet --|
    |-------------*/ 
    google-chrome
    thunderbird
    tdesktop
    clematis #mpris for discord
    vesktop
    #spotify
    /*pkgs.nixpkgs-master.*/bitwarden
    komikku
    kdePackages.tokodon
    kdePackages.neochat
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
    strawberry-qt6 
    mpv
    (texlive.combine {inherit (texlive) scheme-medium abnt abntex2 collection-langportuguese dvipng latexmk todonotes;})
    cherrytree
    /*kile */
    imagemagick
    ghostscript
    /*okular*/
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
    #geogebra
    octaveFull
    nicotine-plus
    qbittorrent
    unar
    unzip
    zip
    xsane
    #remmina
    virt-viewer
    freerdp
    htop lm_sensors powerstat
    nixos-icons
    mesa-demos
    /*----------------|
    |---   games   ---|
    |----------------*/
    easyrpg-player
    crispy-doom
    dsda-doom
    dsda-launcher
    prismlauncher
    runelite 
    steam #fix steam games: SDL_VIDEODRIVER=x11 prime-run %command% -vulkan
    #itch #marked as broken 24/03/24
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
