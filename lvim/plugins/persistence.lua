return {
    "folke/persistence.nvim",
    event = "VimEnter",
    config = function()
        require("persistence").setup({
            dir = os.getenv("HOME") .. "/.config/lvim/session/",
            options = { "buffers", "curdir", "tabpages", "winsize" },
        })
    end,
}
