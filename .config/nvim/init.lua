vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

vim.g.clipboard = {
	name = "OSC 52 (Copy Only)",
	copy = {
		["+"] = require("vim.ui.clipboard.osc52").copy "+",
		["*"] = require("vim.ui.clipboard.osc52").copy "*",
	},
	paste = {
		["+"] = function()
			return nil
		end,
		["*"] = function()
			return nil
		end,
	},
}
vim.opt.clipboard:append "unnamedplus"

require "juanakajuan"
