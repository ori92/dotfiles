-- Add lvim config folder to path
package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/lvim/?.lua"

-- AutoCommands
require("autocmd")

-- General Options
require("options")

-- Builtin Plugins Options
require("builtin")

-- Keymaps
require("mappings")

-- Additional Plugins
lvim.plugins = require("plugins")

-- LSP config
require("lsp")
