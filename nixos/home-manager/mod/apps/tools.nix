{ pkgs, ... }:
{
  imports = [ 
    #./separated/dunst.nix 
    ./separated/foot.nix
    ./separated/fuzzel.nix
    #./separated/kitty.nix
    ./separated/rclone.nix
    ./separated/zathura.nix
    ./separated/solaar.nix
    ./separated/vimiv.nix
    ./separated/wlogout.nix
  ];
  home.packages = with pkgs; [
    flatpak
    gh
    scrcpy
    octaveFull
    nicotine-plus
    qbittorrent
    unar
    unzip
    zip
    xsane 
    virt-viewer
    freerdp
    htop lm_sensors powerstat
    nixos-icons
    mesa-demos
    pavucontrol
    android-file-transfer
    kdePackages.filelight
    doublecmd
  ];
}
