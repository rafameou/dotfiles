{ config, inputs, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    enableVteIntegration = true;
    history = {
      size = 10000;
      expireDuplicatesFirst = true;
      path = "${config.xdg.cacheHome}/zsh/history";
    };
    plugins = with pkgs; [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = "${zsh-nix-shell}/share/zsh-nix-shell";
      }
      /*{
      name = "zsh-completions";
      file = "zsh-completions.plugin.zsh";
      src = "${zsh-completions}/share/zsh-completions";
      }*/
      /*{
        name = "zsh-autocomplete";
        file = "zsh-autocomplete.plugin.zsh";
        src = "${zsh-autocomplete}/share/zsh-autocomplete";
      }*/
      {
        name = "zsh-vi-mode";
        file = "zsh-vi-mode.plugin.zsh";
        src = "${zsh-vi-mode}/share/zsh-vi-mode";
      }
    ];
    /*oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "dstufft";
    };*/
    shellAliases = {
      diff = "diff --color=auto";
      dmesg = "dmesg --color=always";
      grep = "grep --color=auto";
      ip = "ip --color=auto";
      ls = "ls --color=auto";
      sudo = "sudo "; # Makes commands after sudo keep colour (https://github.com/rafaelrc7/dotfiles/blob/master/users/rafael/zsh.nix)
    };
    initExtra = ''
      autoload -U colors && colors
      prompt() {
        PS1="%{%F{154}%}%n%{%f%}@%{%F{45}%}%m%{%f%}:%{%F{87}%}%~ %{%f%}%# "
        RPROMPT="%{%f%}%?"
      }

      precmd_functions+=prompt
    '';
  };
}
