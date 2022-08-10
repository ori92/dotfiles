return {
  "KabbAmine/vCoolor.vim", -- vCoolor - Cool Color Selector
  "sindrets/winshift.nvim", -- WinShift - Rearrange your windows with ease  TODO: Needs Mappings
  "ThePrimeagen/harpoon", -- Harpoon - Quick file access  TODO: Needs Mappings
  "itchyny/vim-cursorword", -- Highlight word under cursor
  "RRethy/nvim-align", -- Align
  "junegunn/vim-easy-align", -- EasyAlign
  "kevinhwang91/nvim-bqf", -- BQF - Better quickfix window
  -- "machakann/vim-sandwich", -- Vim-sandwitch - Surronding TODO: Fix override of 's' key ** needed by lightspeed
  "mg979/vim-visual-multi", -- Visual-multi
  "AndrewRadev/sideways.vim", -- Sideways - Shift parameters
  "AndrewRadev/splitjoin.vim", -- SplitJoin - Needs ruby
  "tpope/vim-eunuch", -- Unix command like 'Delete' and 'Mkdir'
  "tpope/vim-repeat", -- Repeat
  "tpope/vim-surround", -- Surround
  "tpope/vim-unimpaired", -- Unimpaired - Shortcuts
  "hrsh7th/cmp-nvim-lua", -- CMP - Lua completion
  "windwp/nvim-spectre", -- Spectre - Regex Find and Replace
  { -- Tmux integration
    "aserowy/tmux.nvim",
    config = function()
      require("tmux").setup({
        navigation = {
          -- cycles to opposite pane while navigating into the border
          cycle_navigation = false,
          -- enables default keybindings (C-hjkl) for normal mode
          enable_default_keybindings = true,
        },
        resize = {
          -- enables default keybindings (A-hjkl) for normal mode
          enable_default_keybindings = true,
        },
      })
    end,
  },
  { -- Suda
    "lambdalisue/suda.vim",
    config = vim.api.nvim_set_var("suda_smart_edit", 1),
  },
  { -- Vista
    "liuchengxu/vista.vim",
    cmd = "",
  },
  { -- Lsp Signature
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup()
    end,
  },
  { -- LightSpeed - jetpack codebase navigation
    "ggandor/lightspeed.nvim",
    event = "BufRead",
  },
  { -- Trouble A pretty list for showing diagnostics, references, telescope results, quickfix and location lists
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup()
    end,
    cmd = { "Trouble", "TroubleClose", "TroubleRefresh", "TroubleToggle" },
  },
  { -- mundo - undo tree
    "simnalamburt/vim-mundo",
    cmd = { "MundoToggle", "MundoShow", "MundoHide" },
  },
  { -- rainbow
    "p00f/nvim-ts-rainbow",
    config = function()
      require("nvim-treesitter.configs").setup({
        rainbow = {
          enable = true,
          extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
          max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
          colors = {}, -- table of hex strings
          termcolors = {}, -- table of colour name strings
        },
      })
    end,
  },
  {
    "kevinhwang91/rnvimr",
    cmd = "RnvimrToggle",
    config = function()
      vim.g.rnvimr_draw_border = 1
      vim.g.rnvimr_pick_enable = 1
      vim.g.rnvimr_bw_enable = 1
    end,
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
        lastplace_open_folds = true,
      })
    end,
  },
  {
    "folke/persistence.nvim",
    event = "VimEnter",
    module = "persistence",
    config = function()
      require("persistence").setup({
        dir = os.getenv("HOME") .. "/.config/lvim/session/",
        options = { "buffers", "curdir", "tabpages", "winsize" },
      })
    end,
  },
  { -- peeks lines of the buffer in non-obtrusive way.
    "nacro90/numb.nvim",
    config = function()
      require("numb").setup()
    end,
  },
  { -- line indentation indication
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    setup = function()
      vim.g.indentLine_enabled = 1
      vim.g.indent_blankline_char = "▏"
      vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard" }
      vim.g.indent_blankline_buftype_exclude = { "terminal" }
      vim.g.indent_blankline_show_trailing_blankline_indent = true
      vim.g.indent_blankline_show_first_indent_level = false
    end,
  },
  { -- Highlight TODO comments
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  { -- Comment toggle
    "terrortylor/nvim-comment",
    config = function()
      require("nvim_comment").setup()
    end,
  },
}
