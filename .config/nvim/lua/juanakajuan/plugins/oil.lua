return {
	"stevearc/oil.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		require("oil").setup {
			columns = {
				"size",
				"mtime",
				"icon",
			},
			win_options = {
				wrap = true,
			},
			view_options = {
				show_hidden = true,
			},
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
		}
	end,

	vim.keymap.set(
		"n",
		"-",
		"<CMD>Oil<CR>",
		{ desc = "Open parent directory" }
	),
}
