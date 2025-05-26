{ ... }:
{
  hardware.graphics = {
    # this fixes the "glXChooseVisual failed" bug, context: https://github.com/NixOS/nixpkgs/issues/47932
    enable = true;
    enable32Bit = true;
  };
}
