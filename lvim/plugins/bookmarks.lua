return {
    "crusj/bookmarks.nvim",
    branch = "main",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
        require("bookmarks").setup()
    end,
}
