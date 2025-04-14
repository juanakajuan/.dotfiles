return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
		"saghen/blink.cmp",
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup(
				"juan-lsp-attach",
				{ clear = true }
			),
			callback = function(event)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
					noremap = true,
					buffer = true,
					desc = "[G]oto [D]efinition",
				})
				vim.keymap.set("n", "gr", vim.lsp.buf.references, {
					noremap = true,
					buffer = true,
					desc = "[G]oto [R]eferences",
				})
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {
					noremap = true,
					buffer = true,
					desc = "[G]oto [I]mplemenation",
				})
				vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, {
					noremap = true,
					buffer = true,
					desc = "Type [D]efinition",
				})

				vim.keymap.set("n", "<leader>ds", vim.lsp.buf.document_symbol, {
					noremap = true,
					buffer = true,
					desc = "[D]ocument [S]ymbols",
				})
				vim.keymap.set(
					"n",
					"<leader>ws",
					vim.lsp.buf.workspace_symbol,
					{
						noremap = true,
						buffer = true,
						desc = "[W]orkspace [S]ymbols",
					}
				)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
					noremap = true,
					buffer = true,
					desc = "[R]e[n]ame",
				})
				vim.keymap.set(
					{ "n", "x" },
					"<leader>ca",
					vim.lsp.buf.code_action,
					{
						noremap = true,
						buffer = true,
						desc = "[C]ode [A]ction",
					}
				)
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {
					noremap = true,
					buffer = true,
					desc = "[G]oto [D]eclaration",
				})

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if
					client
					and client.supports_method(
						vim.lsp.protocol.Methods.textDocument_documentHighlight
					)
				then
					local highlight_augroup = vim.api.nvim_create_augroup(
						"juan-lsp-highlight",
						{ clear = false }
					)
					vim.api.nvim_create_autocmd(
						{ "CursorHold", "CursorHoldI" },
						{
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						}
					)

					vim.api.nvim_create_autocmd(
						{ "CursorMoved", "CursorMovedI" },
						{
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						}
					)

					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup(
							"juan-lsp-detach",
							{ clear = true }
						),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds {
								group = "juan-lsp-highlight",
								buffer = event2.buf,
							}
						end,
					})
				end

				if
					client
					and client.supports_method(
						vim.lsp.protocol.Methods.textDocument_inlayHint
					)
				then
					vim.keymap.set("n", "<leader>th", function()
						vim.lsp.inlay_hint.enable(
							not vim.lsp.inlay_hint.is_enabled {
								bufnr = event.buf,
							}
						)
					end, {
						noremap = true,
						buffer = true,
						desc = "[T]oggle Inlay [H]ints",
					})
				end
			end,
		})

		if vim.g.have_nerd_font then
			local signs =
				{ ERROR = "", WARN = "", INFO = "", HINT = "" }
			local diagnostic_signs = {}
			for type, icon in pairs(signs) do
				diagnostic_signs[vim.diagnostic.severity[type]] = icon
			end
			vim.diagnostic.config { signs = { text = diagnostic_signs } }
		end

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend(
			"force",
			capabilities,
			require("blink.cmp").get_lsp_capabilities()
		)

		local mason_registry = require "mason-registry"
		local vue_language_server = mason_registry
			.get_package("vue-language-server")
			:get_install_path() .. "/node_modules/@vue/language-server"

		local servers = {
			clangd = {},
			pyright = {},
			rust_analyzer = {},
			volar = {
				cmd = { "pnpm", "vue-language-server", "--stdio" },
				init_options = {
					vue = {
						hybridMode = true,
					},
				},
				settings = {
					typescript = {
						inlayHints = {
							enumMemberValues = {
								enabled = true,
							},
							functionLikeReturnTypes = {
								enabled = true,
							},
							propertyDeclarationTypes = {
								enabled = true,
							},
							parameterTypes = {
								enabled = true,
								suppressWhenArgumentMatchesName = true,
							},
							variableTypes = {
								enabled = true,
							},
						},
					},
				},
			},
			ts_ls = {
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = vue_language_server,
							languages = { "vue" },
						},
					},
				},
				filetypes = {
					"typescript",
					"javascript",
					"javascriptreact",
					"typescriptreact",
					"vue",
				},
				settings = {
					typescript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayParameterNameHintsWhenArgumentMatchesName = true,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = true,
							includeInlayVariableTypeHintsWhenTypeMatchesName = true,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayEnumMemberValueHints = true,
						},
					},
				},
			},
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			},
		}

		require("mason").setup {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		}

		-- You can add other tools here that you want Mason to install
		-- for you, so that they are available from within Neovim.
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua", -- Used to format Lua code
			"black",
			"isort",
			"prettierd",
		})
		require("mason-tool-installer").setup {
			ensure_installed = ensure_installed,
		}

		require("mason-lspconfig").setup {
			exclude = { "jdtls" },
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					-- This handles overriding only values explicitly passed
					-- by the server configuration above. Useful when disabling
					-- certain features of an LSP (for example, turning off formatting for ts_ls)
					server.capabilities = vim.tbl_deep_extend(
						"force",
						{},
						capabilities,
						server.capabilities or {}
					)
					require("lspconfig")[server_name].setup(server)
				end,
			},
		}
	end,
}
