return { -- Trouble A pretty list for showing diagnostics, references, telescope results, quickfix and location lists
    "folke/trouble.nvim",
    config = function()
        require("trouble").setup()
    end,
    cmd = { "Trouble", "TroubleClose", "TroubleRefresh", "TroubleToggle" },
}
