return {
	"yetone/avante.nvim",
	keys = {
		{ "<leader>at", "<CMD>AvanteToggle<CR>", desc = "Avante Toggle" },
	},
	event = "VeryLazy",
	version = "*",
	opts = {
		provider = "claude",
		behavior = {
			auto_suggestions = false,
			enable_cursor_planning_mode = true,
		},
		providers = {
			claude = {
				endpoint = "https://api.anthropic.com",
				model = "claude-sonnet-4-20250514",
				extra_request_body = {
					temperature = 0,
					max_tokens = 32768,
				},
				disabled_tools = { "python" },
			},
		},
		windows = {
			-- position = "bottom",
			width = 35,
		},
	},
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	build = "make",
	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
	dependencies = {
		"stevearc/dressing.nvim",
		"folke/which-key.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional
		"folke/snacks.nvim",
		"echasnovski/mini.icons",
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		},
	},
}
