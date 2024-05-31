{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (retroarch.override {
      cores = with libretro; [
        blastem
        beetle-psx-hw
        dolphin
        fceumm
        parallel-n64
        ppsspp
        snes9x
      ];
    })
  ];
}
