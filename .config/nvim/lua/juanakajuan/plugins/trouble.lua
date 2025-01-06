return {
	"folke/trouble.nvim",
	opts = {},
	cmd = "Trouble",
	keys = {
		{
			"<leader>tt",
			"<CMD>Trouble diagnostics toggle focus=true<CR>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>tw",
			"<CMD>Trouble diagnostics toggle focus=true filter.buf=0<CR>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>to",
			"<CMD>Trouble todo toggle focus=true filter.buf=0<CR>",
			desc = "TODO Comments (Trouble)",
		},
	},
}
