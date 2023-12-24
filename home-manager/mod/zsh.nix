{ inputs, lib, config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    enableAutosuggestions = true;
    enableVteIntegration = true;
    history = {
      size = 10000;
      expireDuplicatesFirst = true;
      path = "${config.xdg.cacheHome}/zsh/history";
    };
    plugins = with pkgs; [
      {
        name = "zsh-nix-shell";
        src = "${zsh-nix-shell}/share/zsh-nix-shell";
      }
      {
        name = "zsh-completions";
        src = "${zsh-completions}/share/zsh-completions";
      }
      {
        name = "zsh-vi-mode";
        src = "${zsh-vi-mode}/share/zsh-vi-mode";
      }
    ];
    ohMyZsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "dstufft";
    };
    shellAliases = {
      diff = "diff --color=auto";
      dmesg = "dmesg --color=always";
      grep = "grep --color=auto";
      ip = "ip --color=auto";
      ls = "ls --color=auto";
      sudo = "sudo "; # Makes commands after sudo keep colour (https://github.com/rafaelrc7/dotfiles/blob/master/users/rafael/zsh.nix)
    };
  };
}
