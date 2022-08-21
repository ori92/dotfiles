local ki = lvim.keys.insert_mode
local kn = lvim.keys.normal_mode
local kv = lvim.keys.visual_mode
local wk = lvim.builtin.which_key.mappings

lvim.leader = "space"

-- TODO: set captions for which-key in visual mode after <Leader>.

kn["<esc><esc>"] = "<cmd>nohlsearch<cr>"
kn["Y"] = "y$"
kv["p"] = '"_dP'
kn["cw"] = '"_ciw'
kn["ci"] = '"_ci'

-- Execute Current Line in Shell
kn["<A-x>"] = "V:w !bash<CR>"

ki["<C-l>"] = "<Right>"
ki["<C-h>"] = "<Left>"
ki["<C-k>"] = "<Up>"
ki["<C-j>"] = "<Down>"

-- Next/Prev Buffer
kn["L"] = "<Cmd>BufferLineCycleNext<CR>"
kn["H"] = "<Cmd>BufferLineCyclePrev<CR>"

-- Move to the end of yanked text after yank and paste
kn["p"] = "p`]"
kv["y"] = "y`]"
kv["p"] = "p`]"

-- Disable ex mode mapping
kn["Q"] = "<Nop>"
kn["q:"] = "<Nop>"

-- C-z for undo
kn["<C-z>"] = "<Cmd>undo<CR>"
ki["<C-z>"] = "<ESC>ui"

-- Switch windows quicker
wk["<Left>"] = { "<cmd>lua require('tmux').move_left()<cr>", "which_key_ignore" }
wk["<Right>"] = { "<cmd>lua require('tmux').move_right()<cr>", "which_key_ignore" }
wk["<Up>"] = { "<cmd>lua require('tmux').move_top()<cr>", "which_key_ignore" }
wk["<Down>"] = { "<cmd>lua require('tmux').move_bottom()<cr>", "which_key_ignore" }

-- Resize windows
kn["<C-Left>"] =  "<cmd>lua require('tmux').resize_left()<cr>"
kn["<C-Right>"] =  "<cmd>lua require('tmux').resize_right()<cr>"
kn["+"] = "<cmd>lua require('tmux').resize_top()<cr>"
kn["-"] = "<cmd>lua require('tmux').resize_bottom()<cr>"

-- Use Ctrl-s for saving
kn["<C-S>"] = ":write<CR>"
kv["<C-S>"] = "<Esc>:write<CR>"
ki["<C-S>"] = "<Esc>:write<CR>"

-- Do not copy on d
kn["d"] = '"_d'
kn["X"] = "dd"
kv["d"] = '"_d'
kv["X"] = "dd"

--- keep text selected after indentation
kv["<"] = "<gv"
kv[">"] = ">gv"

-- Move to beginning/end of line while in insert mode
ki["<C-a>"] = "<C-o>^"
ki["<C-e>"] = "<C-o>$"

-- Move lines Up/Down using Alt+Arrows
kn["<c-m-Up>"] = ":m .-2<CR>=="
kn["<c-m-Down>"] = ":m .+1<CR>=="
ki["<c-m-Up>"] = ":m .-2<CR>=="
ki["<c-m-Down>"] = ":m .+1<CR>=="
kv["<c-m-Up>"] = ":m '<-2<CR>gv=gv"
kv["<c-m-Down>"] = ":m '>+1<CR>gv=gv"

-- In addition to C-w: delete word around/after the cursor
ki["<C-d>"] = "<C-o>daw"
kn["<C-d>"] = "daw"

-- Duplicate a line / selection and comment out the first
wk["C"] = { "Ypk:CommentToggle<CR>j", "Duplicate comment" }
kv["<Leader>C"] = "gcgvyPgvgc"

-- Typing gcc is too much (comments toggle)
kn["<C-c>"] = ":CommentToggle<CR>"
ki["<C-c>"] = "<cmd>CommentToggle<CR>"
kv["<C-c>"] = ":CommentToggle<CR>gv"

-- Align in visual-mode
kv["<Leader>A"] = "<Plug>(EasyAlign)"

-- WinShift
wk["w"] = { ":WinShift<cr>", "WinShift" }

-- Add quick map('n', 'pings', 'for sideways.vim that allow shifting of arguments', opts)
wk["S"] = {
    name = "+Sideways",
    h = { ":sidewaysleft<cr>", "left" },
    l = { ":sidewaysright<cr>", "right" },
}

wk["h"] = {
    name = "+Harpoon",
    a = { ":lua require('harpoon.mark').add_file()<CR>", "Add" },
    n = { ":lua require('harpoon.ui').toggle_quick_menu()<CR>", "Show Menu" },
    h = { ":lua require('telescope').load_extension('harpoon')<CR>:Telescope harpoon marks<CR>", "Telescope" },
}
-- Insert current date
wk["i"] = { '"=strftime("%b %d, %Y")<CR>p', "insert date" }

-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
kn["ga"] = "<Plug>(EasyAlign)"

wk["j"] = { ":HopChar2<CR>", "Hop to Char" }
wk["J"] = { ":HopWord<CR>", "Hop to Word" }

-- Trouble
wk["t"] = {
    name = "+Trouble",
    r = { "<cmd>Trouble lsp_references<cr>", "References" },
    f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
    d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
    q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
    l = { "<cmd>Trouble loclist<cr>", "LocationList" },
    w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
    t = { "<cmd>TodoTrouble<CR>", "Todo's" },
}

wk["r"] = {
    name = "+Replace",
    r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
    w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
    f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
}

wk["Q"] = {
    name = "+Quit",
    s = { "<cmd>lua require('persistence').load()<cr>", "Restore for current dir" },
    l = { "<cmd>lua require('persistence').load({last=true})<cr>", "Restore last session" },
    d = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

-- Cheatsheet
wk["?"] = { "<cmd>Cheatsheet<cr>", "Cheatsheet" }

-- Toggle lsp virtual_text
wk["lt"] = { ":lua vim.diagnostic.config({virtual_text=not vim.diagnostic.config().virtual_text})<CR>", "Toggle Text" }

-- Abbreviations
local abbreviations = {
    Wq = "wq",
    WQ = "wq",
    Wqa = "wqa",
    W = "w",
    Q = "q",
    Qa = "qa",
    wrap = "set wrap",
    nowrap = "set nowrap",
}

for left, right in pairs(abbreviations) do
    vim.cmd(string.format("cnoreabbrev %s %s", left, right))
end
