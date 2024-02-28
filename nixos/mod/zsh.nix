{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = false;
  };
  users.defaultUserShell = pkgs.zsh;
}
