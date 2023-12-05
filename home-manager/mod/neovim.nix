{ inputs, lib, config, pkgs, ... }:
{
  programs.neovim = with pkgs; {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with vimPlugins; [
      #theme
      catppuccin-nvim
      #latex
      vimPlugins.vimtex
      coc-ltex
      #nix
      vim-nix
    ];

    extraConfig = ''
      colorscheme catppuccin-frappe
    '';

    extraConfigLua = ''
      vim.cmd.colorscheme "catppuccin"
    '';
  };
}
