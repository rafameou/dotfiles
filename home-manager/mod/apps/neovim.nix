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
      nvim-tree-lua
      nvim-treesitter.withAllGrammars
      nvim-lspconfig
      luasnip
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      cmp_luasnip
      nvim-cmp
      /*theme*/
      gruvbox-nvim
      /*catppuccin-nvim*/
      /*nix*/
      vim-nix
      /*latex*/
      vimtex
    ];

    extraConfig = ''
      filetype plugin indent on
      syntax enable
      let g:vimtex_view_method = 'zathura'
      autocmd User VimtexEventQuit VimtexClean
      nnoremap <F5> :VimtexCompile<CR>
      nnoremap <F6> :VimtexStop<CR>:VimtexClean<CR>
    '';

    extraLuaConfig = ''
      -- spelling
      vim.opt.spelllang = 'pt_br';
      vim.opt.spell = true;
      -- inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u; --https://castel.dev/post/lecture-notes-1/
      vim.api.nvim_set_keymap('i', '<C-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u', { noremap = true }); 

      -- theme
      -- require("catppuccin").setup({
      --  flavour = "frappe",
        -- transparent_background = true,
      --});
      --vim.cmd.colorscheme "catppuccin";
      vim.o.background = "dark";
      vim.cmd([[colorscheme gruvbox]]);

      -- neo-tree
      -- disable netrw at the very start of your init.lua
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      -- set termguicolors to enable highlight groups
      vim.opt.termguicolors = true
      -- empty setup using defaults
      require("nvim-tree").setup()
      local function open_nvim_tree(data)
        -- buffer is a real file on the disk
        local real_file = vim.fn.filereadable(data.file) == 1
          -- buffer is a [No Name]
          local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
          if not real_file and not no_name then
          return
        end
        -- open the tree, find the file but don't focus it
        require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
      end
      vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree });

      -- snippets
      local luasnip = require'luasnip';
      local s = luasnip.snippet;
      local sn = luasnip.snippet_node;
      local t = luasnip.text_node;
      local i = luasnip.insert_node;
      local f = luasnip.function_node;
      local c = luasnip.choice_node;
      local d = luasnip.dynamic_node;
      local r = luasnip.restore_node;

      -- cmp
      local cmp = require'cmp';
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end
        };
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        };
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        });
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
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
      luasnip.add_snippets("tex", {
        s("\\beg", {t({ "\\documentclass[a4paper]{article}", 
                        "\\usepackage{todonotes}", 
                        "\\begin{document}", 
                        "\\section*{ - \\today}", "",}), 
                        i(1), 
                        t({"", 
                        "\\end{document}",}), }),

        --text
        s("\\dc", { t("\\documentclass{"), i(1), t("}"), }),
        s("\\bf", { t("\\textbf{"), i(1), t("}"), }),
        s("\\it", { t("\\textit{"), i(1), t("}"), }),
        s("\\section", { t("\\section{"), i(1), t("}"), }), 
        s("\\todo", { t("\\todo{"), i(1), t("}"), }), 

        -- math
        s("\\frac", { t("\\frac{"), i(1), t("}{"), i(2), t("}"), }),
      });

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
