return {
	{
		"williamboman/mason.nvim",
		"mfussenegger/nvim-lint",
		"rshkarin/mason-nvim-lint",
		"stevearc/conform.nvim",
		"zapling/mason-conform.nvim",
		opts = {
			ensure_installed = {
				"stylua",
				"shfmt",
				"shellcheck",
				"black",
				"isort",
				"pyright",
				"rust-analyzer",
				"gopls",
				"goimports",
				"typescript-language-server",
				"eslint_d",
				"prettierd",
				"tailwindcss-language-server",
				"css-lsp",
				"html-lsp",
				"vue-language-server",
				"svelte-language-server",
				"csharp-language-server",
				"netcoredbg",
				"jdtls",
				"markdownlint",
				"sqls",
			},
		},
		config = function()
			require("mason-nvim-lint").setup()
			require("mason-conform").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup()
		end,
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				json = { "prettierd" },
				go = { "goimports", "gofmt" },
				rust = { "rustfmt" },
				markdown = { "prettierd" },
				bash = { "shfmt" },
				sql = { "sqlfluff" },
			},
			formatters = {
				sqlfluff = {
					command = "sqlfluff",
					args = { "fix", "-" },
					stdin = true,
					exit_codes = { 0, 1 },
					timeout_ms = 5000,
				},
			},
		},
	},
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				python = { "flake8" },
				json = { "eslint_d" },
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				markdown = { "markdownlint" },
				bash = { "shellcheck" },
				sql = { "sqlfluff" },
			}
			vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"williamboman/mason-nvim-dap.nvim",
			"leoluz/nvim-dap-go",
		},
		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = { "python", "delve", "netcoredbg" },
				automatic_installation = true,
			})
			local dap, dapui = require("dap"), require("dapui")
			local dapgo = require("dap-go")

			-- 1. Setup the UI
			dapui.setup()
			dapgo.setup()

			-- 2. Attach listeners to auto-open/close the UI
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "", numhl = "" })

			vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })

			-- Essential DAP Controls
			vim.keymap.set("n", "<leader>dc", function()
				require("dap").continue()
			end, { desc = "Debug: Start/Continue" })
			vim.keymap.set("n", "<leader>do", function()
				require("dap").step_over()
			end, { desc = "Debug: Step Over" })
			vim.keymap.set("n", "<leader>di", function()
				require("dap").step_into()
			end, { desc = "Debug: Step Into" })
			vim.keymap.set("n", "<leader>du", function()
				require("dap").step_out()
			end, { desc = "Debug: Step Out" })

			-- UI Specific Keymaps
			vim.keymap.set("n", "<leader>dt", function()
				dapui.toggle()
			end, { desc = "Debug: Toggle UI" })
			vim.keymap.set("n", "<leader>de", function()
				dapui.eval()
			end, { desc = "Debug: Eval Under Cursor" })
		end,
	},
}
