return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		require("gruvbox").setup {
			bold = true,
			italic = {
				strings = false,
				emphasis = false,
				comments = true,
				operators = false,
				folds = true,
			},
			transparent_mode = true,
		}
		vim.cmd [[colorscheme gruvbox]]
	end,
}
