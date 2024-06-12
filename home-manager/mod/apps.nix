{ pkgs, ... }:
{
  imports = [
    #./apps/dunst.nix
    #./apps/foot.nix
    #./apps/fuzzel.nix
    #./apps/kitty.nix
    #./apps/luakit.nix
    ./apps/neovim.nix
    #./apps/qutebrowser.nix
    ./apps/rclone.nix
    #./apps/vimiv.nix
    #./apps/vscode.nix
    ./apps/zathura.nix
  ]; 
  programs.firefox = {
    enable = true; 
    package = pkgs.floorp;
    /*nativeMessagingHosts = with pkgs; [
      firefoxpwa
    ];*/
  };
  home.packages = with pkgs; [
    /*-------------|
    |-- internet --|
    |-------------*/
    google-chrome
    thunderbird
    telegram-desktop
    vesktop
    #spotify
    /*pkgs.nixpkgs-master.*/bitwarden
    komikku
    #kdePackages.tokodon
    #kdePackages.neochat #broken 21-05
    whatsapp-for-linux
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
    feishin #strawberry-qt6 
    mpv
    (texlive.combine {inherit (texlive) scheme-medium abnt abntex2 collection-langportuguese dvipng latexmk todonotes;})
    cherrytree
    imagemagick
    ghostscript
    /*okular*/
    #gromit-mpx
    #speedcrunch
    #notepadqq
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
    trayscale
    /*---------------*/
  ];
}
