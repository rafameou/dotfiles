{ inputs, lib, config, pkgs, ... }:
{
  #esc + v + esc ou ctrl + v + esc
  environment.etc."issue".text = ''
[1;32m<<< Bem-Vindo a \n! >>[0m
NixOS com GNU/Linux \r (\m)

[1;36mHoje é \d, agora sao \t e voce esta na \l[0m
Caso voce tenha encontrado esse computador sozinho aleatoriamente por ai, contate: 
+55 (42) 9 8402-6139 (telefone, whatsapp ou telegram) ou rafaelmazz22@gmail.com
  '';
}
