{ pkgs, ... }:
{
  #"open with dedicated graphics card" on gnome
  services.switcherooControl.enable = true;

  # nvidia prime
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.prime = {
    #offload.enable = true;
    sync.enable = true;
    #reverseSync.enable = true;

    #offload.enableOffloadCmd = true;

    # Bus ID of the Intel GPU. You can find it using lspci, either under 3D or VGA
    intelBusId = "PCI:0:2:0";

    # Bus ID of the NVIDIA GPU. You can find it using lspci, either under 3D or VGA
    nvidiaBusId = "PCI:1:0:0";
  };
}
