# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, lib, config, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./bulbasaur-hw.nix
      ./mod/boot-grub.nix
      ./mod/nix.nix
      ./mod/bluetooth.nix
      ./mod/desktop.nix
      ./mod/sway.nix
      ./mod/pipewire.nix
      ./mod/ssd.nix
      ./mod/time.nix
      ./mod/user.nix
      ./mod/distrobox.nix
    ];

  # ... changes to only this sytem
  networking.hostName = "bulbasaur"; # Define your hostname.

  #esc + v + esc ou ctrl + v + esc
  environment.etc."issue".text = ''
[1;32m<<< Bem-Vindo a \n! >>[0m
NixOS com GNU/Linux \r (\m)

[1;36mHoje é \d, agora sao \t e voce esta na \l[0m
Caso voce tenha encontrado esse computador sozinho aleatoriamente por ai, contate: 
+55 (42) 9 8402-6139 (telefone, whatsapp ou telegram) ou rafaelmazz22@gmail.com

'';

  # enable geoclue2 services
  services.geoclue2.enable = true;

  #services.zerotierone.enable = true;

  #console.keyMap = "br-thinkpad";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}