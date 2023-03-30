-- Options

-- lvim.lsp.diagnostics.virtual_text = false
table.insert(lvim.builtin.cmp.sources, { name = "rg" })
lvim.format_on_save = false
lvim.log.level = "warn"
vim.opt.scrolloff = 10
vim.opt.cmdheight = 1
vim.opt.list = true
vim.opt.timeoutlen = 200
vim.opt.undofile = true -- enable persistent undo
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.listchars = {
    tab = "→ ",
    extends = "⟩",
    precedes = "⟨",
    trail = "·",
    nbsp = "␣",
    eol = "↲",
}
