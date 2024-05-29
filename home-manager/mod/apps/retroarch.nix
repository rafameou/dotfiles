{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (retroarch.override {
      cores = with libretro; [
        beetle-psx-hw
        dolphin
        parallel-n64
        ppsspp
        snes9x
      ];
    })
  ];
}
