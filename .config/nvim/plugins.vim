" Project https://github.com/junegunn/vim-plug.
" Auto-install "vim-plug" if not yet installed.
if empty(glob(stdpath('data') . '/site/autoload/plug.vim'))
  silent execute '!curl -fLo '.stdpath('data').'/site/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" Specify a directory for plugins.
call plug#begin()

" Specifying plugins.
Plug 'https://github.com/nvim-lua/plenary.nvim' " plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.
Plug 'https://gitlab.com/HiPhish/info.vim.git' " Read and browse info files in Vim.
Plug 'https://github.com/ledger/vim-ledger' " Vim plugin for Ledger.
Plug 'https://github.com/nvim-orgmode/orgmode' " Orgmode clone written in Lua for Neovim.
Plug 'https://github.com/fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Go development plugin for Vim.
Plug 'https://github.com/lervag/vimtex' " A modern vim plugin for editing LaTeX files.
Plug 'https://github.com/mrcjkb/rustaceanvim' " Supercharge your Rust experience in Neovim! A heavily modified fork of rust-tools.nvim.
Plug 'https://github.com/rhysd/vim-grammarous' " A powerful grammar checker for Vim using LanguageTool.
Plug 'https://github.com/lukas-reineke/indent-blankline.nvim' " Indent guides for Neovim.
Plug 'https://gitlab.com/HiPhish/rainbow-delimiters.nvim' " Rainbow delimiters for Neovim with Tree-sitter.
Plug 'https://github.com/nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Nvim Treesitter configurations and abstraction layer.
Plug 'https://github.com/nvim-treesitter/nvim-treesitter-context' " Show code context.
Plug 'https://github.com/jose-elias-alvarez/null-ls.nvim' " Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
Plug 'https://github.com/Vimjas/vim-python-pep8-indent' " A nicer Python indentation style for vim.
Plug 'https://github.com/vim-airline/vim-airline' " Lean & mean status/tabline for vim that's light as air.
Plug 'https://github.com/vim-airline/vim-airline-themes' " A collection of themes for vim-airline.
Plug 'https://github.com/luukvbaal/nnn.nvim.git' " File manager for Neovim powered by nnn.
Plug 'https://github.com/z-shell/zi-vim-syntax' " A Vim syntax definition for ZI commands in any ft=zsh file.
Plug 'https://github.com/junegunn/fzf' " A command-line fuzzy finder.
Plug 'https://github.com/junegunn/fzf.vim' " fzf heart vim.
Plug 'https://github.com/mhinz/vim-signify' " Show a diff using Vim its sign column.
Plug 'https://github.com/tpope/vim-fugitive' " A Git wrapper so awesome, it should be illegal.
Plug 'https://github.com/tpope/vim-obsession' " Continuously updated session files.
Plug 'https://github.com/tpope/vim-scriptease' " A Vim plugin for Vim plugins.
Plug 'https://github.com/tpope/vim-sensible' " Defaults everyone can agree on.
Plug 'https://github.com/tpope/vim-surround' " surround.vim: quoting/parenthesizing made simple
Plug 'https://github.com/tpope/vim-sleuth'
Plug 'https://github.com/numtostr/Comment.nvim' " Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more.
Plug 'https://github.com/tpope/vim-abolish' " Easily search for, substitute, and abbreviate multiple variants of a word.
Plug 'https://github.com/bfredl/nvim-miniyank' " Killring-alike plugin for neovim and vim 8 with no default mappings.
Plug 'https://github.com/sophacles/vim-processing' " For processing.org
Plug 'https://github.com/windwp/nvim-ts-autotag' " Use treesitter to auto close and auto rename html tag
Plug 'https://github.com/dylanaraps/wal.vim' " Generate and change colorschemes on the fly.
Plug 'https://github.com/dkprice/vim-easygrep' " Fast and Easy Find and Replace Across Multiple Files.
Plug 'https://github.com/lambdalisue/suda.vim' " An alternative sudo.vim for Vim and Neovim, limited support sudo in Windows.
Plug 'https://github.com/ntpeters/vim-better-whitespace' " Better whitespace highlighting for Vim.
Plug 'https://github.com/neovim/nvim-lspconfig' " Quickstart configs for Nvim LSP
Plug 'https://github.com/hrsh7th/cmp-nvim-lsp' " nvim-cmp source for neovim builtin LSP client
Plug 'https://github.com/hrsh7th/cmp-buffer' " nvim-cmp source for buffer words.
Plug 'https://github.com/hrsh7th/cmp-path' " nvim-cmp source for path.
Plug 'https://github.com/hrsh7th/cmp-cmdline' " nvim-cmp source for vim's cmdline.
Plug 'https://github.com/hrsh7th/cmp-nvim-lua' " nvim-cmp source for nvim lua.
Plug 'https://github.com/hrsh7th/nvim-cmp' " A completion plugin for neovim coded in Lua.
Plug 'https://github.com/L3MON4D3/LuaSnip', {'do': 'make install_jsregexp'} " Snippet Engine for Neovim written in Lua.
Plug 'https://github.com/saadparwaiz1/cmp_luasnip' " luasnip completion source for nvim-cmp.
Plug 'https://github.com/rafamadriz/friendly-snippets' " Set of preconfigured snippets for different languages.

" Plugins not for vscode.
if !exists('g:vscode')
    Plug 'https://github.com/nvim-tree/nvim-tree.lua' " A file explorer tree for neovim written in lua
    Plug 'https://github.com/nvim-tree/nvim-web-devicons' " Adds file type icons to Vim plugins
    Plug 'https://github.com/prichrd/netrw.nvim' " It's not because we use netrw that we cannot have nice things!
endif

" Only if started by a browser.
if exists('g:started_by_firenvim')
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } } " Embed Neovim in your browser.
endif

" Depending on whether vim or nvim is running.
if has('nvim')
    "Plug 'https://github.com/Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' } " Dark powered asynchronous unite all interfaces for Neovim/Vim8.
else
    Plug 'https://github.com/Shougo/denite.nvim' " Dark powered asynchronous unite all interfaces for Neovim/Vim8.
    Plug 'https://github.com/roxma/nvim-yarp' " Yet Another Remote Plugin Framework for Neovim.
    Plug 'https://github.com/roxma/vim-hug-neovim-rpc'
endif

" Initialize plugin system.
call plug#end()
