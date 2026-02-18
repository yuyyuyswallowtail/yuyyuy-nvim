return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
		},
		version = "1.*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				["<CR>"] = { "accept", "fallback" },
				["<Tab>"] = {
					"select_next",
					"snippet_forward",
					"fallback",
				},
				["<S-Tab>"] = {
					"select_prev",
					"snippet_backward",
					"fallback",
				},
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = { "hide" },
				["<C-u>"] = { "scroll_documentation_up", "fallback" },
				["<C-d>"] = { "scroll_documentation_down", "fallback" },
			},
			appearance = { nerd_font_variant = "mono" },
			cmdline = {
				enabled = true,
				completion = {
					list = {
						selection = {
							preselect = false,
							auto_insert = true,
						},
					},
					menu = { auto_show = true },
				},
			},
			completion = {
				menu = {
					draw = {
						columns = {
							{ "kind_icon", "label", "label_description", "source_name", gap = 1 },
						},
						components = {
							kind_icon = {
								ellipsis = false,
								text = function(ctx)
									return require("lspkind").symbolic(ctx.kind, { mode = "symbol" })
								end,
							},
						},
					},
				},
				list = {
					selection = {
						preselect = false,
						auto_insert = true,
					},
				},
				documentation = { auto_show = false },
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				providers = {
					path = {
						opts = {
							get_cwd = function(_)
								return vim.fn.getcwd()
							end,
						},
					},
				},
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000,
		config = function()
			require("tiny-inline-diagnostic").setup({
				preset = "powerline",
				options = {
					use_icons_from_diagnostic = true,
					overflow = {
						mode = "wrap",
						padding = 0,
						enable_on_insert = true,
					},
				},
			})
			vim.diagnostic.config({ virtual_text = false })
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		opts = {
			servers = {
				gopls = {},
				rust_analyzer = {},
				pyright = {},
				vtsls = {},
				html = {},
				cssls = {},
				tailwindcss = {},
				volar = {},
				svelte = {},
				csharp_ls = {},
				lua_ls = {},
				prismals = {},
				emmet_language_server = {},
				sqls = {
					cmd = {
						"sqls",
						"-config",
						"~/.config/sqls/config.yaml",
					},
				},
			},
			diagnostics = { virtual_text = false },
		},
		config = function(_, opts)
			local blink = require("blink.cmp")
			local capabilities = blink.get_lsp_capabilities({
				textDocument = {
					foldingRange = {
						dynamicRegistration = false,
						lineFoldingOnly = true,
					},
				},
			})
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local buf = event.buf
					local map = vim.keymap.set
					local opts = { buffer = buf }

					map("n", "K", vim.lsp.buf.hover, opts)
					map("n", "gd", vim.lsp.buf.definition, opts)
					map("n", "gD", vim.lsp.buf.declaration, opts)
					map("n", "gi", vim.lsp.buf.implementation, opts)
					map("n", "go", vim.lsp.buf.type_definition, opts)
					map("n", "gr", vim.lsp.buf.references, opts)
					map("n", "gs", vim.lsp.buf.signature_help, opts)
					map("n", "<F2>", vim.lsp.buf.rename, opts)
					map({ "n", "x" }, "<F3>", function()
						vim.lsp.buf.format({ async = true })
					end, opts)
					map("n", "<F4>", vim.lsp.buf.code_action, opts)
				end,
			})

			local signs = {
				[vim.diagnostic.severity.ERROR] = " ",
				[vim.diagnostic.severity.WARN] = " ",
				[vim.diagnostic.severity.HINT] = " ",
				[vim.diagnostic.severity.INFO] = " ",
			}

			vim.diagnostic.config({
				signs = {
					text = signs,
				},
			})

			for server, config in pairs(opts.servers) do
				config.capabilities = capabilities
				vim.lsp.config(server, config)
				vim.lsp.enable(server)
			end
			require("ufo").setup()
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}
