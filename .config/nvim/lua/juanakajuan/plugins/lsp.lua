return {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		{ "j-hui/fidget.nvim", opts = {} },

		"saghen/blink.cmp",
	},

	config = function()
		require("mason").setup {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		}

		local ensure_installed = {
			"clangd",
			"pyright",
			"rust-analyzer",
			"vue-language-server",
			"typescript-language-server",
			"lua-language-server",
			"jdtls",

			-- Formatters/Linters
			"stylua",
			"black",
			"isort",
			"prettierd",
		}

		require("mason-tool-installer").setup {
			ensure_installed = ensure_installed,
		}

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup(
				"juan-lsp-attach",
				{ clear = true }
			),
			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(
						mode,
						keys,
						func,
						{ buffer = event.buf, desc = "LSP: " .. desc }
					)
				end

				map(
					"gd",
					require("telescope.builtin").lsp_definitions,
					"[G]oto [D]efinition"
				)
				map(
					"gr",
					require("telescope.builtin").lsp_references,
					"[G]oto [R]eferences"
				)
				map(
					"gI",
					require("telescope.builtin").lsp_implementations,
					"[G]oto [I]mplementation"
				)
				map(
					"<leader>D",
					require("telescope.builtin").lsp_type_definitions,
					"Type [D]efinition"
				)
				map(
					"<leader>ds",
					require("telescope.builtin").lsp_document_symbols,
					"[D]ocument [S]ymbols"
				)
				map(
					"<leader>ws",
					require("telescope.builtin").lsp_dynamic_workspace_symbols,
					"[W]orkspace [S]ymbols"
				)
				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				map(
					"<leader>ca",
					vim.lsp.buf.code_action,
					"[C]ode [A]ction",
					{ "n", "x" }
				)
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if
					client
					and client:supports_method(
						vim.lsp.protocol.Methods.textDocument_documentHighlight
					)
				then
					local highlight_augroup = vim.api.nvim_create_augroup(
						"kickstart-lsp-highlight",
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
							"kickstart-lsp-detach",
							{ clear = true }
						),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds {
								group = "kickstart-lsp-highlight",
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
					map("<leader>th", function()
						vim.lsp.inlay_hint.enable(
							not vim.lsp.inlay_hint.is_enabled {
								bufnr = event.buf,
							}
						)
					end, "[T]oggle Inlay [H]ints")
				end
			end,
		})

		vim.lsp.config("clangd", {
			cmd = { "clangd" },
			filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
		})
		vim.lsp.config("pyright", {
			cmd = { "pyright-langserver", "--stdio" },
			filetypes = { "python" },
		})
		vim.lsp.config("rust_analyzer", {
			cmd = { "rust-analyzer" },
			filetypes = { "rust" },
			settings = {
				["rust-analyzer"] = { check = { command = "clippy" } },
			},
		})
		vim.lsp.config("volar", {
			cmd = { "vue-language-server", "--stdio" },
			filetypes = { "vue" },
		})

		local mason_registry = require "mason-registry"
		local vue_language_server_path = mason_registry
			.get_package("vue-language-server")
			:get_install_path() .. "/node_modules/@vue/language-server"

		vim.lsp.config("tsserver", {
			cmd = { "typescript-language-server", "--stdio" },
			filetypes = {
				"typescript",
				"javascript",
				"vue",
				"typescriptreact",
				"javascriptreact",
			},
			init_options = {
				plugins = {
					{
						name = "@vue/typescript-plugin",
						location = vue_language_server_path,
						languages = { "vue" },
					},
				},
			},
		})
		vim.lsp.config("lua_ls", {
			cmd = { "lua-language-server" },
			filetypes = { "lua" },
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					completion = { callSnippet = "Replace" },
					diagnostics = { globals = { "vim" } },
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
					telemetry = { enable = false },
				},
			},
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

		vim.lsp.enable {
			"clangd",
			"pyright",
			"rust_analyzer",
			"volar",
			"tsserver",
			"lua_ls",
		}
	end,
}
