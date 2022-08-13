local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
    {
        command = "stylua",
        args = {},
        filetypes = { "lua" },
    },
})
