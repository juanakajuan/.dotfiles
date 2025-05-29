vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Replace the word that I am currently on
vim.keymap.set(
	"n",
	"<leader>rw",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Find and replace on current word" }
)

vim.keymap.set(
	"x",
	"<leader>p",
	'"_dP',
	{ desc = "Paste over highlighted text and still have the stuff I pasted" }
)

-- Page jump up and down while keeping cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set(
	"n",
	"k",
	"v:count == 0 ? 'gk' : 'k'",
	{ expr = true, silent = true }
)
vim.keymap.set(
	"n",
	"j",
	"v:count == 0 ? 'gj' : 'j'",
	{ expr = true, silent = true }
)

vim.keymap.set(
	"n",
	"<leader>e",
	vim.diagnostic.open_float,
	{ desc = "Open floating diagnostic message" }
)
vim.keymap.set(
	"n",
	"<leader>fh",
	"<CMD>syntax sync fromstart<CR>",
	{ desc = "Fix syntax highlighting" }
)

-- Map Alt + number to tab navigation
for i = 1, 9 do
	vim.keymap.set("n", "<A-" .. i .. ">", i .. "gt")
end

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer.sh<CR>")
vim.keymap.set("n", "<F7>", function()
	vim.opt.spell = not vim.opt.spell:get()
end, { noremap = true, silent = true, desc = "Toggle Spell Check" })

vim.keymap.set("n", "<leader>gs", "<CMD>Neogit<CR>")

local prefill_edit_window = function(request)
	require("avante.api").edit()
	local code_bufnr = vim.api.nvim_get_current_buf()
	local code_winid = vim.api.nvim_get_current_win()
	if code_bufnr == nil or code_winid == nil then
		return
	end
	vim.api.nvim_buf_set_lines(code_bufnr, 0, -1, false, { request })
	-- Optionally set the cursor position to the end of the input
	vim.api.nvim_win_set_cursor(code_winid, { 1, #request + 1 })
	-- Simulate Ctrl+S keypress to submit
	vim.api.nvim_feedkeys(
		vim.api.nvim_replace_termcodes("<C-s>", true, true, true),
		"v",
		true
	)
end

local avante_fix_diagnostics = "fix @diagnostics"
local avante_summarize = "Summarize the following text"
local avante_explain_code = "Explain the following code"
local avante_add_docstring = "Add docstring to the following codes"
local avante_fix_bugs = "Fix the bugs inside the following codes if any"
local avante_add_tests = "Implement tests for the following code"
local avante_optimize_code = "Optimize the following code"

vim.keymap.set("v", "<leader>ad", function()
	require("avante.api").ask {
		question = avante_fix_diagnostics,
	}
end, { desc = "Fix Diagnostics" })

vim.keymap.set({ "v" }, "<leader>as", function()
	require("avante.api").ask { question = avante_summarize }
end, { desc = "Summarize Text (ask)" })

vim.keymap.set({ "v" }, "<leader>ae", function()
	require("avante.api").ask { question = avante_explain_code }
end, { desc = "Explain Code (ask)" })

vim.keymap.set({ "v" }, "<leader>ad", function()
	require("avante.api").ask { question = avante_add_docstring }
end, { desc = "Add Docstring (ask)" })

vim.keymap.set({ "v" }, "<leader>ab", function()
	require("avante.api").ask { question = avante_fix_bugs }
end, { desc = "Fix Bugs (ask)" })

vim.keymap.set({ "v" }, "<leader>at", function()
	require("avante.api").ask { question = avante_add_tests }
end, { desc = "Add Tests (ask)" })

vim.keymap.set({ "n", "v" }, "<leader>ao", function()
	require("avante.api").ask { question = avante_optimize_code }
end, { desc = "Optimize Code (ask)" })
