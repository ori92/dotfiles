local o = vim.opt                   -- vim options
local cmd = vim.cmd                 -- cmd
local map = vim.api.nvim_set_keymap -- Keymaps
local fn  = vim.fn                  -- Functions
local g   = vim.g                   -- a table to access global variables

require "paq" {
  "savq/paq-nvim";                            -- package manager
  'mhinz/vim-startify';                       -- Start screen
  'tjdevries/colorbuddy.vim';                 -- Themes
  'tjdevries/gruvbuddy.nvim';                 -- Current theme
  'lambdalisue/suda.vim';                     -- Write as Sudo
  'preservim/nerdtree';                       -- Nerdtree
  {'junegunn/fzf', run = fn['fzf#install']};  -- Fzf
  'junegunn/fzf.vim';                         -- Fzf
  'nvim-treesitter/nvim-treesitter';          -- Treesitter
  'neovim/nvim-lspconfig';                    -- Language server
  'onsails/lspkind-nvim';                             -- Lsp icons
  'neoclide/coc.nvim';                        -- Completions
  'vim-airline/vim-airline';                  -- Stuatusbar
  'vim-airline/vim-airline-themes';           -- Themes
  'ryanoasis/vim-devicons';                   -- Icons
  'easymotion/vim-easymotion';                -- Easy motion
  'justinmk/vim-sneak';                       -- s for motion
  'luochen1990/rainbow';                      -- Parenthesis colors
  'voldikss/vim-floaterm';                    -- Floating terminal
  'mg979/vim-visual-multi';                   -- Multi line select
  'nvim-lua/popup.nvim';                      -- Telescope
  'nvim-lua/plenary.nvim';                    -- Telescope
  'nvim-telescope/telescope.nvim';            -- Telescope
}

require('colorbuddy').colorscheme('gruvbuddy');

g.NERDTreeWinPos = "right";         -- Set NerdTree on the right side
g.NERDTreeShowHidden=1;             -- Show hidden files by default
g.NERDTreeIgnore={'.DS_Store$', '.git$'}

g.mapleader = ' '                   -- Change leader key to Space
g.suda_smart_edit = 1               -- Suda smart edit
g.rainbow_active = 1                -- Colorize parenthesis on startup
g['deoplete#.enable_at_startup'] = 1 -- enable deoplete on startup
g['airline#extensions#tabline#enabled'] = 1
g['EasyMotion_smartcase'] = 1;


o.expandtab = true                -- Use spaces instead of tabs
o.hidden = true                   -- Enable background buffers
o.ignorecase = true               -- Ignore case
o.joinspaces = false              -- No double spaces with join
o.list = true                     -- Show some invisible characters
o.number = true                   -- Show line numbers
o.relativenumber = false          -- Relative line numbers
o.scrolloff = 999                 -- Lines of context
o.sidescrolloff = 999             -- Cursor stays in the center
o.shiftround = true               -- Round indent
o.shiftwidth = 2                  -- Size of an indent
o.smartcase = true                -- Do not ignore case with capitals
o.smartindent = true              -- Insert indents automatically
o.splitright = true               -- Put new windows right of current
o.tabstop = 2                     -- Number of spaces tabs count for
o.termguicolors = true            -- True color support
o.wrap = true                     -- Enable line wrap
o.mouse = 'a'                     -- Enable mouse

-- TreeSitter
local ts = require 'nvim-treesitter.configs'
ts.setup {ensure_installed = 'all', highlight = {enable = true}}

-- Leader <Space> + z for fzf files
map('n', '<Leader>z', ':Files<cr>', { noremap = true});

-- Leader <Space> + r for rg
map('n', '<Leader>g', ':Rg<cr>', { noremap = true});

-- Leader <Space> +t for Nerdtree
map('n', '<Leader>t', ':NERDTreeToggle<cr>', {noremap = true});

-- Switch buffers
map('n', '<Leader>b', ':bnext<cr>', { noremap = true});
map('n', '<Leader>B', ':bprev<cr>', { noremap = true});

-- Find files using Telescope command-line sugar.
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true});
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true});
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true});
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true});


cmd(':command! WQ wq')
cmd(':command! WQ wq')
cmd(':command! Wq wq')
cmd(':command! Wqa wqa')
cmd(':command! W w')
cmd(':command! Q q')


require('lspkind').init({
    -- enables text annotations
    --
    -- default: true
    with_text = true,

    -- default symbol map
    -- can be either 'default' or
    -- 'codicons' for codicon preset (requires vscode-codicons font installed)
    --
    -- default: 'default'
    preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
      Text = '',
      Method = 'ƒ',
      Function = '',
      Constructor = '',
      Variable = '',
      Class = '',
      Interface = 'ﰮ',
      Module = '',
      Property = '',
      Unit = '',
      Value = '',
      Enum = '了',
      Keyword = '',
      Snippet = '﬌',
      Color = '',
      File = '',
      Folder = '',
      EnumMember = '',
      Constant = '',
      Struct = ''
    },
})
