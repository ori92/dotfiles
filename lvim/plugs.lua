return {
    -- "stevearc/dressing.nvim", -- Prettier UI  TODO: figure out why vim.ui.input returns empty string
    "folke/tokyonight.nvim", -- colorscheme
    "marko-cerovac/material.nvim", -- Material colorscheme
    "KabbAmine/vCoolor.vim", -- vCoolor - Cool Color Selector
    "sindrets/winshift.nvim", -- WinShift - Rearrange your windows with ease
    "ThePrimeagen/harpoon", -- Harpoon - Quick file access
    "itchyny/vim-cursorword", -- Highlight word under cursor
    "RRethy/nvim-align", -- Align
    "junegunn/vim-easy-align", -- EasyAlign
    "kevinhwang91/nvim-bqf", -- BQF - Better quickfix window
    "mg979/vim-visual-multi", -- Visual-multi
    "AndrewRadev/sideways.vim", -- Sideways - Shift parameters
    "AndrewRadev/splitjoin.vim", -- SplitJoin - Needs ruby
    "tpope/vim-eunuch", -- Unix command like 'Delete' and 'Mkdir'
    "tpope/vim-repeat", -- Repeat
    "tpope/vim-surround", -- Surround
    "tpope/vim-unimpaired", -- Unimpaired - Shortcuts
    "hrsh7th/cmp-nvim-lua", -- CMP - Lua completion
    "windwp/nvim-spectre", -- Spectre - Regex Find and Replace
    "liuchengxu/vista.vim", -- Vista
    require("plugins/bookmarks"),
    require("plugins/nvim-colorizer"),
    require("plugins/tmux"),
    require("plugins/hop"),
    require("plugins/cheatsheet"),
    require("plugins/surround"),
    require("plugins/suda"),
    require("plugins/lsp_signature"),
    require("plugins/trouble"),
    require("plugins/vim-mundo"),
    require("plugins/nvim-ts-rainbow"),
    require("plugins/rnvimr"),
    require("plugins/nvim-lastplace"),
    require("plugins/persistence"),
    require("plugins/numb"),
    require("plugins/indent-blankline"),
    require("plugins/todo-comments"),
    require("plugins/nvim-comments"),
}
