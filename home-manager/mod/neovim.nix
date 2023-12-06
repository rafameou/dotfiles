{ inputs, lib, config, pkgs, ... }:
{
  programs.neovim = with pkgs; {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    withPython3 = true;
    plugins = with vimPlugins; [
      nvim-treesitter.withAllGrammars
      nvim-lspconfig
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      nvim-cmp
      /*theme*/
      catppuccin-nvim
      /*nix*/
      vim-nix
      /*latex*/
      vimtex
    ];

    extraConfig = ''
      colorscheme catppuccin-frappe

      filetype plugin indent on
      syntax enable
      let g:vimtex_view_method = 'zathura'
    '';

    extraLuaConfig = ''
      vim.opt.spelllang = 'pt_br';
      vim.opt.spell = true;

      require("catppuccin").setup({
        flavour = "frappe",
        -- transparent_background = true,
      });
      vim.cmd.colorscheme "catppuccin";

      local cmp = require'cmp';
      cmp.setup({
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        };
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
        });
      });
      
      local lspconfig = require "lspconfig"
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- clang
      lspconfig.clangd.setup {
        cmd = { "${clang-tools}/bin/clangd" },
        filetypes = { "c", "cpp", "h", "hpp", "objc", "objcpp", "cuda" },
        root_dir = function() return vim.loop.cwd() end,
        capabilities = capabilities,
      };

      -- latex
      lspconfig.texlab.setup{
        cmd = { "${texlab}/bin/texlab" },
        capabilities = capabilities,
      };

      -- nix
      lspconfig.rnix.setup{
        cmd = { "${rnix-lsp}/bin/rnix-lsp" },
        capabilities = capabilities,
      };

      -- go
      lspconfig.gopls.setup{
        cmd = { "${gopls}/bin/gopls" },
        capabilities = capabilities,
      };
    '';
  };
}
