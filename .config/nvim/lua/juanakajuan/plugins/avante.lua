return {
	"yetone/avante.nvim",
	keys = {
		{ "<leader>at", "<CMD>AvanteToggle<CR>", desc = "Avante Toggle" },
	},
	event = "VeryLazy",
	lazy = false,
	version = "*",
	opts = {
		provider = "gemini",
		gemini = {
			model = "gemini-2.5-pro-preview-05-06",
			temperature = 0,
			max_tokens = 8192,
			disable_tools = true,
		},
		behavior = {
			auto_suggestions = false,
		},
		windows = {
			-- position = "bottom",
			width = 45,
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
		--- The below dependencies are optional,
		"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
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
