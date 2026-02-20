return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = true,
				ensure_installed = {
					"rust_analyzer",
					"gopls",
					"tailwindcss",
					"cssls",
					"html",
					"svelte",
					"csharp_ls",
					"jdtls",
					"sqls",
					"pyright",
					"vtsls",
					"emmet_language_server",
					"prismals",
				},
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		dependencies = {
			"zapling/mason-conform.nvim",
		},
		config = function()
			require("mason-conform").setup({
				ensure_installed = {
					"stylua",
					"isort",
					"black",
					"prettierd",
					"goimports",
					"gofmt",
					"shfmt",
				},
			})
			require("conform").setup({
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
				},
			})
		end,
	},
	{
		"mfussenegger/nvim-lint",
		dependencies = {
			"rshkarin/mason-nvim-lint",
		},
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("mason-nvim-lint").setup({
				ensure_installed = {
					"flake8",
					"eslint_d",
					"markdownlint",
				},
			})
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
			dapui.setup()
			dapgo.setup()
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
			vim.keymap.set("n", "<leader>dt", function()
				dapui.toggle()
			end, { desc = "Debug: Toggle UI" })
			vim.keymap.set("n", "<leader>de", function()
				dapui.eval()
			end, { desc = "Debug: Eval Under Cursor" })
		end,
	},
}
