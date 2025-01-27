{ ... }:
{
  zramSwap = {
    enable = true;
    priority = 5;
    algorithm = "zstd";
    memoryPercent = 100;
  };

  # backup swap
  swapDevices = [ {
    device = "/var/lib/swapfile";
    priority = 0;
    size = 8*1024;
  } ];
}
