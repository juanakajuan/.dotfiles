return {
	"saghen/blink.cmp",
	dependencies = {
		"Kaiser-Yang/blink-cmp-avante",
		{ "L3MON4D3/LuaSnip", version = "v2.*" },
	},
	version = "1.*",

	opts = {
		snippets = { preset = "luasnip" },
		keymap = { preset = "default" },
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			documentation = { auto_show = true },
			menu = {
				draw = {
					components = {
						-- customize the drawing of kind icons
						kind_icon = {
							text = function(ctx)
								-- default kind icon
								local icon = ctx.kind_icon
								-- if LSP source, check for color derived from documentation
								if ctx.item.source_name == "LSP" then
									local color_item =
										require("nvim-highlight-colors").format(
											ctx.item.documentation,
											{ kind = ctx.kind }
										)
									if color_item and color_item.abbr then
										icon = color_item.abbr
									end
								end
								return icon .. ctx.icon_gap
							end,
							highlight = function(ctx)
								-- default highlight group
								local highlight = "BlinkCmpKind" .. ctx.kind
								-- if LSP source, check for color derived from documentation
								if ctx.item.source_name == "LSP" then
									local color_item =
										require("nvim-highlight-colors").format(
											ctx.item.documentation,
											{ kind = ctx.kind }
										)
									if
										color_item and color_item.abbr_hl_group
									then
										highlight = color_item.abbr_hl_group
									end
								end
								return highlight
							end,
						},
					},
					columns = {
						{ "kind_icon", "label", "label_description", gap = 1 },
						{ "kind" },
					},
				},
			},
			ghost_text = { enabled = false },
		},
		sources = {
			default = {
				"avante",
				"lazydev",
				"lsp",
				"path",
				"snippets",
				"buffer",
			},
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
				avante = {
					module = "blink-cmp-avante",
					name = "Avante",
					opts = {},
				},
			},
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
