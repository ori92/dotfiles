local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
    { command = "black" },
    {
        command = "prettier",
        args = { "--print-width", "100" },
        filetypes = { "typescript", "typescriptreact" },
    },
    {
        command = "stylua",
        args = {},
        filetypes = { "lua" },
    },
})

local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
    { command = "flake8" },
    {
        command = "shellcheck",
        args = { "--severity", "warning" },
    },
    {
        command = "codespell",
        filetypes = { "javascript", "python" },
    },
})

local code_actions = require("lvim.lsp.null-ls.code_actions")
code_actions.setup({
    {
        command = "proselint",
    },
})
