{ inputs, lib, config, pkgs, ... }:
{
  imports = [
    inputs.nix-colors.homeManagerModules.default
  ];

  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;

  /*------------------------------------------------------------|
  |  Please note that most configs are stolen from Misterio77,  |
  |  I mean he made nix-colors and i'm way too lazy to config   |
  |  everything myself :P                                       |
  |------------------------------------------------------------*/
}
