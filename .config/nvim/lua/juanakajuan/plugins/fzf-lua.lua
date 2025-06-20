return {
	"ibhagwan/fzf-lua",
	dependencies = { "echasnovski/mini.icons" },
	opts = {
		winopts = {
			fullscreen = true,
		},
	},
	keys = {
		{
			"<leader>sf",
			"<CMD>FzfLua files<CR>",
			desc = "[S]earch [F]iles",
		},
		{
			"<leader>sg",
			"<CMD>FzfLua live_grep<CR>",
			desc = "[S]earch [G]rep",
		},
		{
			"<leader>sr",
			"<CMD>FzfLua resume<CR>",
			desc = "[S]earch [R]esume",
		},
	},
}
