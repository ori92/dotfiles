-- Builtin Plugin Options

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "startify"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = false
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.filters.custom = { "^.git$", "^.vscode$" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.treesitter.matchup.enable = true
lvim.builtin.treesitter.ensure_installed =
    { "bash", "c", "javascript", "json", "lua", "python", "rust", "java", "yaml" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.telescope.defaults.file_ignore_patterns = { ".git", "node_modules" }
lvim.builtin.alpha.startify.section.top_buttons.entries =
    { { "e", "  New File", "<CMD>ene!<CR>" }, { "q", "  Quit", "<CMD>q!<CR>" } }
lvim.builtin.dap.active = false
