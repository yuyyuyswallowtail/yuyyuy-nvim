return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"RRethy/base16-nvim",
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
		},
	},
	{
		"luukvbaal/statuscol.nvim",
		opts = function()
			local builtin = require("statuscol.builtin")
			return {
				segments = {
					{
						text = { builtin.foldfunc },
						click = "v:lua.ScFa",
					},
					{ text = { " %s" }, click = "v:lua.ScSa" },
					{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
				},
			}
		end,
	},
	{
		"mg979/vim-visual-multi",
		branch = "master",
	},
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				render = "compact",
				background_colour = "#000000",
			})
			vim.notify = require("notify")
		end,
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup()

			vim.keymap.set("n", "<leader>ha", function()
				harpoon:list():add()
			end, { desc = "Harpoon Add File" })

			for i = 1, 7 do
				vim.keymap.set("n", "<leader>hr" .. i, function()
					local list = require("harpoon"):list()
					local item = list:get(i)
					if item then
						list:remove(item)
						print("Harpoon: Removed slot " .. i)
					else
						print("Harpoon: Slot " .. i .. " is already empty")
					end
				end, { desc = "Harpoon Delete Slot " .. i })
			end
			vim.keymap.set("n", "<leader>hc", function()
				harpoon:list():clear()
			end, { desc = "Harpoon Clear File" })

			vim.keymap.set("n", "<A-h>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = "Harpoon Menu" })

			for i = 1, 7 do
				vim.keymap.set("n", "<leader>" .. i, function()
					require("harpoon"):list():select(i)
				end, {
					desc = "Harpoon to Slot " .. i,
				})
			end
		end,
	},
}
