return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		dashboard = { enabled = true },
		indent = {
			enabled = true,
			animate = {
				enabled = false,
			},
		},
		picker = {
			enabled = true,
			layout = {
				layout = {
					backdrop = false,
					width = 0.8,
					min_width = 80,
					height = 0.9,
					min_height = 30,
					box = "vertical",
					border = "rounded",
					title = "{title} {live} {flags}",
					title_pos = "center",
					{ win = "input", height = 1, border = "bottom" },
					{ win = "list", border = "none" },
					{
						win = "preview",
						title = "{preview}",
						height = 0.6,
						border = "top",
					},
				},
			},
		},
	},
	keys = {
		{
			"<leader>sf",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart Find Files",
		},
		{
			"<leader>sg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>sc",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"<leader>sn",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Notification History",
		},
	},
}
