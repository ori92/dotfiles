return { -- line indentation indication
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
}
