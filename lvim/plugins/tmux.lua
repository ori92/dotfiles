return { -- Tmux integration
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
            copy_sync = {
                enable = false,
            },
        })
    end,
}
