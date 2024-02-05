{ inputs, lib, config, pkgs, ... }:
{
  #esc + v + esc ou ctrl + v + esc
  environment.etc."issue".text = ''
<<< Bem-Vindo a \n! >>>
NixOS com GNU/Linux \r (\m)

Hoje é \d, agora sao \t e você está na \l
Caso você tenha encontrado esse computador sozinho aleatoriamente por ai, contate @rafameou no telegram, mais redes sociais em rafameou.github.io.
  '';
}
