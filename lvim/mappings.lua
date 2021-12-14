local k = lvim.keys
local ki = k.insert_mode
local kn = k.normal_mode
local kv = k.visual_mode
local wk = lvim.builtin.which_key.mappings

lvim.leader = "space"

kn["<esc><esc>"] = "<cmd>nohlsearch<cr>"
kn["Y"] = "y$"
kv["p"] = [["_dP]]

-- kn["<Up>"] = "<nop>"
-- kn["<Down>"] = "<nop>"
-- kn["<Left>"] = "<nop>"
-- kn["<Right>"] = "<nop>"

-- Move Cursor in insert mode
ki["<C-l>"] = "<Right>"
ki["<C-h>"] = "<Left>"
ki["<C-k>"] = "<Up>"
ki["<C-j>"] = "<Down>"

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
wk["<Left>"] = { "<C-w><Left>", "which_key_ignore" }
wk["<Right>"] = { "<C-w><Right>", "which_key_ignore" }
wk["<Up>"] = { "<C-w><Up>", "which_key_ignore" }
wk["<Down>"] = { "<C-w><Down>", "which_key_ignore" }

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
ki["<C-a>"] = "<C-o>0"
ki["<C-e>"] = "<C-o>$"

-- Move lines Up/Down using Alt+Arrows
kn["<m-Up>"] = ":m .-2<CR>=="
kn["<m-Down>"] = ":m .+1<CR>=="
ki["<m-Up>"] = ":m .-2<CR>=="
ki["<m-Down>"] = ":m .+1<CR>=="
kv["<m-Up>"] = ":m '<-2<CR>gv=gv"
kv["<m-Down>"] = ":m '>+1<CR>gv=gv"

-- In addition to C-w: delete word around/after the cursor
ki["<C-d>"] = "<C-o>daw"
kn["<C-d>"] = "daw"

-- Duplicate a line / selection and comment out the first
wk["C"] = { "Ypk:CommentToggle<CR>j", "Duplicate comment" }
kv["<Leader>C"] = "gcgvyPgvgc"

-- Typing gcc is too much
kn["<C-c>"] = ":CommentToggle<CR>"
ki["<C-c>"] = "<cmd>CommentToggle<CR>"
kv["<C-c>"] = ":CommentToggle<CR>gv"

-- Add quick map('n', 'pings', 'for sideways.vim that allow shifting of arguments', opts)
wk["S"] = {
	name = "Sideways",
	h = { ":SidewaysLeft<CR>", "Left" },
	l = { ":SidewaysRight<CR>", "Right" },
}

-- Insert current date
wk["i"] = { '"=strftime("%b %d, %Y")<CR>p', "insert date " }

-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
kn["ga"] = "<Plug>(EasyAlign)"

wk["j"] = { ":HopChar2<CR>", "Hop to char" }

-- Trouble
wk["t"] = {
	name = "+Trouble",
	r = { "<cmd>Trouble lsp_references<cr>", "References" },
	f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
	d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
	q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
	l = { "<cmd>Trouble loclist<cr>", "LocationList" },
	w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
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

--- Resize windows
wk["+"] = { ":vertical resize +10<cr>", "VResize +10" }
wk["-"] = { ":vertical resize -10<cr>", "VResize -10" }

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
