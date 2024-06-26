{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (retroarch.override {
      cores = with libretro; [
        blastem
        beetle-psx-hw
        dolphin
        fceumm
        flycast
        parallel-n64
        pcsx2
        play
        ppsspp
        snes9x
      ];
    })

    pcsx2
  ];
}
