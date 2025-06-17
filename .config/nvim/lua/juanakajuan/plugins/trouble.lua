return {
	"folke/trouble.nvim",
	opts = {},
	cmd = "Trouble",
	keys = {
		{
			"<leader>xX",
			"<CMD>Trouble diagnostics toggle focus=true<CR>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>xx",
			"<CMD>Trouble diagnostics toggle focus=true filter.buf=0<CR>",

			desc = "Buffer Diagnostics (Trouble)",
		},
	},
}
