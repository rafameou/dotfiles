{ pkgs, stylix, ... }:
{
  home.packages = with pkgs; [
    killall
    android-file-transfer
  ];

  systemd.user.services = {
    wayland-idle-pipewire-inhibit-serv = {
      Unit = {
        Wants = "graphical-session.target";
        After = "graphical-session.target";
      };

      Service = {
        Type = "simple";
        ExecStart = "${pkgs.wayland-pipewire-idle-inhibit}/bin/wayland-pipewire-idle-inhibit -b -d 5";
        Restart = "on-failure";
        RestartSec = 30;
      };

      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
    };
  };

  /*stylix = {
    enable = true;
    autoEnable = false;
    targets = {
      i3.enable = true;
      nixvim.enable = true;
      sway.enable = true;
      vim.enable = true;
      vscode.enable = true;
      zathura.enable = true;
    };
  };*/

  /*  programs.bash = {
  enable = true;
  profileExtra = ''*/
  /*programs.zsh = {
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
  };*/
}
