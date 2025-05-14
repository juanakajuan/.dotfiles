vim.opt.swapfile = false
vim.opt.showmode = false
vim.g.have_nerd_font = true

vim.opt.wrap = true
vim.opt.expandtab = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.scrolloff = 10

vim.opt.incsearch = true
vim.opt.inccommand = "split"

-- Global statusline
vim.opt.laststatus = 3

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Set completeopt to have a better completion experience
vim.opt.completeopt = "menuone,noselect"

vim.opt.termguicolors = true

vim.opt.spelllang = "en"

vim.opt.clipboard = "unnamedplus"

local function paste()
	return {
		vim.fn.split(vim.fn.getreg "", "\n"),
		vim.fn.getregtype "",
	}
end

vim.g.clipboard = {
	name = "OSC 52",
	copy = {
		["+"] = require("vim.ui.clipboard.osc52").copy "+",
		["*"] = require("vim.ui.clipboard.osc52").copy "*",
	},
	paste = {
		["+"] = paste,
		["*"] = paste,
	},
}
