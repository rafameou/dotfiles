{ pkgs, ... }:
{
  home.packages = with pkgs; [
    killall
    vimiv-qt
    android-file-transfer
  ];

  stylix.targets.kde.enable = false;

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
}
