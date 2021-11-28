return {
	"junegunn/vim-easy-align", -- EasyAlign.
	"kevinhwang91/nvim-bqf", -- bqf - better quickfix window.
	"machakann/vim-sandwich", -- vim-sandwitch - surronding.
	"mg979/vim-visual-multi", -- visual-multi
	"mhinz/vim-startify", -- Startify.
	"AndrewRadev/sideways.vim", -- sideways - shift parameters.
	-- 'AndrewRadev/splitjoin.vim', -- splitjoin - needs ruby.

	"tpope/vim-eunuch", -- Unix command like 'Delete' and 'Mkdir'
	"tpope/vim-repeat", -- Repeat.
	-- "tpope/vim-surround", -- Surround.
	"tpope/vim-unimpaired", -- Unimpaired - shortcuts.
	{ -- Suda
		"lambdalisue/suda.vim",
		config = vim.api.nvim_set_var("suda_smart_edit", 1),
	},
	{ -- Vista
		"liuchengxu/vista.vim",
		cmd = "",
	},
	{ -- Lsp Signature
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").setup()
		end,
	},
	{ -- Hop - easy-motion
		"phaazon/hop.nvim",
		cmd = { "HopWord", "HopPattern", "HopChar1", "HopChar2", "HopLine" },
		config = function()
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	},

	{ -- Trouble A pretty list for showing diagnostics, references, telescope results, quickfix and location lists
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup()
		end,
		cmd = { "Trouble", "TroubleClose", "TroubleRefresh", "TroubleToggle" },
	},
	{ -- mundo - undo tree
		"simnalamburt/vim-mundo",
		cmd = { "MundoToggle", "MundoShow", "MundoHide" },
	},
	-- { -- rainbow
	-- 	"p00f/nvim-ts-rainbow",
	-- 	config = function()
	-- 		require("nvim-treesitter.configs").setup({
	-- 			rainbow = {
	-- 				enable = true,
	-- 				extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
	-- 				max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
	-- 				colors = {}, -- table of hex strings
	-- 				termcolors = {}, -- table of colour name strings
	-- 			},
	-- 		})
	-- 	end,
	-- },
	{ -- spectre - find and replace
		"windwp/nvim-spectre",
	},
	{
		"kevinhwang91/rnvimr",
		cmd = "RnvimrToggle",
		config = function()
			vim.g.rnvimr_draw_border = 1
			vim.g.rnvimr_pick_enable = 1
			vim.g.rnvimr_bw_enable = 1
		end,
	},
	{
		"ethanholz/nvim-lastplace",
		event = "BufRead",
		config = function()
			require("nvim-lastplace").setup({
				lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
				lastplace_ignore_filetype = {
					"gitcommit",
					"gitrebase",
					"svn",
					"hgcommit",
				},
				lastplace_open_folds = true,
			})
		end,
	},
	{
		"folke/persistence.nvim",
		event = "VimEnter",
		module = "persistence",
		config = function()
			require("persistence").setup({
				dir = os.getenv("HOME") .. "/.config/lvim/session/",
				options = { "buffers", "curdir", "tabpages", "winsize" },
			})
		end,
	},
	{ -- Highlight first letter of a word.
		"unblevable/quick-scope",
		config = vim.api.nvim_set_var("qs_highlight_on_keys", { "f", "F", "t", "T" }),
	},
	{ --peeks lines of the buffer in non-obtrusive way.
		"nacro90/numb.nvim",
		config = function()
			require("numb").setup()
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		setup = function()
			vim.g.indentLine_enabled = 1
			vim.g.indent_blankline_char = "▏"
			vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard" }
			vim.g.indent_blankline_buftype_exclude = { "terminal" }
			vim.g.indent_blankline_show_trailing_blankline_indent = false
			vim.g.indent_blankline_show_first_indent_level = true
		end,
	},
	-- { -- Orgmode - organizer
	-- 	"kristijanhusak/orgmode.nvim",
	-- 	config = function()
	-- 		require("orgmode").setup({})
	-- 	end,
	-- },
}