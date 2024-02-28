{ pkgs, ... }:
{
  imports = [
    #./desktop-environment/gnome.nix
    ./desktop-environment/kde.nix
    #./desktop-environment/mate.nix
    #./desktop-environment/xfce.nix
  ];

  home.packages = with pkgs; [
    killall
    vimiv-qt
    android-file-transfer
  ];

  /*  programs.bash = {
  enable = true;
  profileExtra = ''*/
  programs.zsh = {
    loginExtra = ''
      export PATH="$HOME/.local/bin:$PATH" ;
    '';
  };

  home.file = {
    ".local/bin/prime-run" = {
      text = ''
        export __NV_PRIME_RENDER_OFFLOAD=1
        export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
        export __GLX_VENDOR_LIBRARY_NAME=nvidia
        export __VK_LAYER_NV_optimus=NVIDIA_only
        exec "$@"
      '';
      executable = true;
    };
  };

  /*services.udisks2.enable = true; services.playerctld.enable = true;*/
}
