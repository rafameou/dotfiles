{
  config,
  inputs,
  pkgs,
  ...
}:
let
  nvim-spell-pt-utf8-dictionary = builtins.fetchurl {
    url = "https://ftp.nluug.nl/pub/vim/runtime/spell/pt.utf-8.spl";
    sha256 = "3e5fc100b6951b783cfb3386ada43cb39839553e04faa415af5cf5bd5d6ab63b";
  };

  nvim-spell-pt-latin-dictionary = builtins.fetchurl {
    url = "https://ftp.nluug.nl/pub/vim/runtime/spell/pt.latin1.spl";
    sha256 = "3c1c362335424c890e683ec99674df8b69dc706b1366fbc205e3955436518680";
  };
in
{
  home.file."${config.xdg.configHome}/nvim/spell/pt.utf-8.spl".source = nvim-spell-pt-utf8-dictionary;
  home.file."${config.xdg.configHome}/nvim/spell/pt.latin1.spl".source =
    nvim-spell-pt-latin-dictionary;

  home.packages = with pkgs; [
    python312Packages.pylatexenc
  ];

  programs.neovim = with pkgs; {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    withPython3 = true;
    plugins = with vimPlugins; [
      {
        plugin = gruvbox-nvim;
        type = "lua";
        config = ''
          vim.o.background = "dark" -- or "light" for light mode
          vim.cmd([[colorscheme gruvbox]])
          vim.cmd('highlight Normal guibg=none')
          vim.cmd('highlight NonText guibg=none')
          vim.cmd('highlight Normal ctermbg=none')
          vim.cmd('highlight NonText ctermbg=none')
        '';
      }
      {
        plugin = nvim-tree-lua;
        type = "lua";
        config = ''
          -- disable netrw at the very start of your init.lua
          vim.g.loaded_netrw = 1
          vim.g.loaded_netrwPlugin = 1
          -- set termguicolors to enale highlight groups
          vim.opt.termguicolors = true
          -- empty setup using defaults
          require("nvim-tree").setup()
          --local function open_nvim_tree(data)
            -- buffer is a real file on the disk
            --  local real_file = vim.fn.filereadable(data.file) == 1
            -- buffer is a [No Name]
            --    local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
            --    if not real_file and not no_name then
            --    return
            --  end
            -- open the tree, find the file but don't focus it
            --  require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
          --end
          -- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree });
        '';
      }
      { plugin = nvim-treesitter.withAllGrammars; }
      { plugin = nvim-lspconfig; }
      {
        plugin = luasnip;
        type = "lua";
        config = ''
          local luasnip = require'luasnip';
          local s = luasnip.snippet;
          local sn = luasnip.snippet_node;
          local t = luasnip.text_node;
          local i = luasnip.insert_node;
          local f = luasnip.function_node;
          local c = luasnip.choice_node;
          local d = luasnip.dynamic_node;
          local r = luasnip.restore_node;

          luasnip.add_snippets("tex", 
          {
            s("\\start", {t({ "\\documentclass[a4paper]{article}", 
                       "\\usepackage{alltt, amssymb, listings, todonotes}",
                       "\\begin{document}", 
                       "\\section*{ - \\today}", "",}), 
                       i(1), 
                       t({"", 
                       "\\end{document}",}), 
            }),

            s("\\verbatim", {t({ "\\begin{verbatim}", "" }),
                       i(1), 
                       t({"", 
                       "\\end{verbatim}",}), 
            }),

            s("\\alltt", {t({ "\\begin{alltt}", "" }),
                       i(1), 
                       t({"", 
                       "\\end{alltt}",}), 
            }), 

            s("\\itemize", {t({ "\\begin{itemize}", "" }),
                        t("\\item "), i(1), 
                        t({"", 
                        "\\end{itemize}",}), 
            }),

            s("\\enumerate", {t({ "\\begin{enumerate}", "" }),
                        t("\\item "), i(1), 
                        t({"", 
                        "\\end{enumerate}",}), 
            }),

            s("\\lstlisting", {t({ "%\\lstset{language=C}", "\\begin{lstlisting}", "" }),
                        i(1), 
                        t({"", 
                        "\\end{lstlisting}",}), 
            }),

            --text
            s("\\dc", { t("\\documentclass{"), i(1), t("}"), }),
            s("\\bf", { t("\\textbf{"), i(1), t("}"), }),
            s("\\it", { t("\\textit{"), i(1), t("}"), }),
            s("\\section", { t("\\section{"), i(1), t("}"), }),
            s("\\todo", { t("\\todo{"), i(1), t("}"), }),

            s("\\red", { t("\\textcolor{red}{"), i(1), t("}"), }),
            s("\\green", { t("\\textcolor{green}{"), i(1), t("}"), }),
            s("\\blue", { t("\\textcolor{blue}{"), i(1), t("}"), }),
            s("\\gray", { t("\\textcolor{gray}{"), i(1), t("}"), }),
            s("\\pink", { t("\\textcolor{pink}{"), i(1), t("}"), }),

            -- math
            s("\\frac", { t("\\frac{"), i(1), t("}{"), i(2), t("}"), }),
          });
        '';
      }
      {
        plugin = cmp-nvim-lsp;
        type = "lua";
        config = ''
          -- mostly stolen from rafaelrc7's dotfile
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
          lspconfig.nil_ls.setup{
            cmd = { "${nil}/bin/nil" },
            capabilities = capabilities,
          };

          -- go
          lspconfig.gopls.setup{
            cmd = { "${gopls}/bin/gopls" },
            capabilities = capabilities,
          };

          -- Rust
          lspconfig.rust_analyzer.setup{
            cmd = { "${rust-analyzer}/bin/rust-analyzer" },
            capabilities = capabilities,
            settings = {
              ['rust-analyzer'] = {
                check = {
                  command = "clippy",
                  features = "all",
                },
              },
            },
          };

          -- Elixir
          lspconfig.elixirls.setup{
            cmd = { "${elixir_ls}/bin/elixir-ls" },
            capabilities = capabilities,
          };

          -- html
          capabilities.textDocument.completion.completionItem.snippetSupport = true;
            lspconfig.html.setup {
            cmd = {"${nodePackages.vscode-langservers-extracted}/bin/vscode-html-language-server", "--stdio"},
            capabilities = capabilities,
          };

          -- CSS
          lspconfig.cssls.setup {
            cmd = {"${nodePackages.vscode-langservers-extracted}/bin/vscode-css-language-server", "--stdio"},
            capabilities = capabilities,
          }

          -- TS
          lspconfig.tsserver.setup{
            cmd = {"${nodePackages.typescript-language-server}/bin/typescript-language-server", "--stdio"},
            capabilities = capabilities,
          };

          -- Json
          lspconfig.jsonls.setup {
            cmd = {"${nodePackages.vscode-langservers-extracted}/bin/vscode-json-language-server", "--stdio"},
            commands = {
              Format = {
                function()
                  vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0});
                end
              },
            },
            capabilities = capabilities,
          };

          -- Python (pyright)
          lspconfig.pyright.setup{
            cmd = {"${pyright}/bin/pyright-langserver", "--stdio"},
            settings = {
              python = {
                analysis = {
                  extraPaths = {".", "src"},
                },
              },
            },
            capabilities = capabilities,
          };

          -- Lua
          lspconfig.lua_ls.setup {
            cmd = {"${sumneko-lua-language-server}/bin/lua-language-server"},
            settings = {
              Lua = {
                      runtime = {
                              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                              version = 'LuaJIT',
                      },
                      diagnostics = {
                              -- Get the language server to recognize the `vim` global
                              globals = {'vim'},
                      },
                      workspace = {
                              -- Make the server aware of Neovim runtime files
                              library = vim.api.nvim_get_runtime_file("", true),
                      },
                      -- Do not send telemetry data containing a randomized but unique identifier
                      telemetry = {
                              enable = false,
                      },
              },
            },
            capabilities = capabilities,
          }
        '';
      }
      { plugin = cmp-buffer; }
      { plugin = cmp-path; }
      { plugin = cmp-cmdline; }
      { plugin = cmp_luasnip; }
      {
        plugin = nvim-cmp;
        type = "lua";
        config = ''
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
        '';
      }
      { plugin = vim-nix; }
      {
        plugin = vimtex;
        config = ''
          let g:vimtex_view_method = 'zathura'
          autocmd User VimtexEventQuit VimtexClean
          nnoremap <F4> :NvimTreeToggle<CR>
          nnoremap <F5> :VimtexCompile<CR>
          nnoremap <F6> :VimtexStop<CR>:VimtexClean<CR>
        '';
      }
      { plugin = img-clip-nvim; }
      { plugin = markview-nvim; }
      { plugin = comment-nvim; }
      {
        plugin = lualine-nvim;
        type = "lua";
        config = ''
                      require("lualine").setup {
          	      options = {
          		icons_enabled = true,
          		theme = "auto",
                        },
                      }
        '';
      }
    ];

    extraLuaConfig = ''
      vim.cmd('filetype plugin indent on');
      vim.cmd('syntax enable');
      vim.opt.colorcolumn = "80,120";
      vim.opt.list = true;
      vim.opt.listchars = {
        tab = "» ",
        space = "·",
        trail = "·",
        extends = "›",
        precedes = "‹",
        nbsp = "␣",
      };

      vim.opt.clipboard:append('unnamedplus');
      -- spelling
      vim.opt.spelllang = 'pt_br';
      vim.opt.spell = true;
      -- inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u; --https://castel.dev/post/lecture-notes-1/
      vim.api.nvim_set_keymap('i', '<C-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u', { noremap = true }); 
    '';
  };
}
