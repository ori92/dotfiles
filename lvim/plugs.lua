return {
    -- "stevearc/dressing.nvim",         -- Prettier UI  TODO: figure out why vim.ui.input returns empty string
    "folke/tokyonight.nvim",             -- colorscheme
    "marko-cerovac/material.nvim",       -- Material colorscheme
    "KabbAmine/vCoolor.vim",             -- vCoolor - Cool Color Selector
    "sindrets/winshift.nvim",            -- WinShift - Rearrange your windows with ease
    "ThePrimeagen/harpoon",              -- Harpoon - Quick file access
    "itchyny/vim-cursorword",            -- Highlight word under cursor
    "RRethy/nvim-align",                 -- Align
    "junegunn/vim-easy-align",           -- EasyAlign
    "kevinhwang91/nvim-bqf",             -- BQF - Better quickfix window
    "mg979/vim-visual-multi",            -- Visual-multi
    "AndrewRadev/sideways.vim",          -- Sideways - Shift parameters
    "AndrewRadev/splitjoin.vim",         -- SplitJoin - Needs ruby
    "tpope/vim-eunuch",                  -- Unix command like 'Delete' and 'Mkdir'
    "tpope/vim-repeat",                  -- Repeat
    "tpope/vim-surround",                -- Surround
    "tpope/vim-unimpaired",              -- Unimpaired - Shortcuts
    "hrsh7th/cmp-nvim-lua",              -- CMP - Lua completion
    "windwp/nvim-spectre",               -- Spectre - Regex Find and Replace
    "liuchengxu/vista.vim",              -- Vista
    require("plugins/bookmarks"),        -- Bookmark-manager
    require("plugins/nvim-colorizer"),   -- Colorizer - highlight colors/hex
    require("plugins/tmux"),             -- Tmux integration
    require("plugins/hop"),              -- Hop - Jump to locations
    require("plugins/cheatsheet"),       -- Cheatsheet
    require("plugins/surround"),         -- Surround
    require("plugins/suda"),             -- Suda - Edit file as root
    require("plugins/lsp_signature"),    -- Lsp Signature
    require("plugins/trouble"),          -- Trouble A pretty list for showing diagnostics, references, telescope results, quickfix and location lists
    require("plugins/vim-mundo"),        -- mundo - undo tree
    require("plugins/nvim-ts-rainbow"),  -- Rainbow parenthesis
    require("plugins/rnvimr"),           -- Ranger File-Manager
    require("plugins/nvim-lastplace"),   -- Restore cursor last place on the file
    require("plugins/persistence"),      -- Session Manager
    require("plugins/numb"),             -- peeks lines of the buffer in non-obtrusive way.
    require("plugins/indent-blankline"), -- Indent blank lines
    require("plugins/todo-comments"),    -- Highlight TODO comments
    require("plugins/nvim-comments"),    -- Comment toggle
}
