return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		indent = {
			enabled = true,
			animate = {
				enabled = false,
			},
		},
		picker = {
			enabled = true,
			layout = {
				preview = "main",
				layout = {
					box = "vertical",
					backdrop = false,
					width = 0,
					height = 0.4,
					position = "bottom",
					border = "top",
					title = " {title} {live} {flags}",
					title_pos = "left",
					{ win = "input", height = 1, border = "bottom" },
					{
						box = "horizontal",
						{ win = "list", border = "none" },
						{
							win = "preview",
							title = "{preview}",
							width = 0.6,
							border = "left",
						},
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
