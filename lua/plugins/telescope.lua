return {
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			require("telescope").setup({
				defaults = {
					preview = {
						treesitter = true,
					},
					file_ignore_patterns = {
						"node_modules",
						"dist",
						"build",
						".next",
					},
				},
			})
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", function()
				builtin.find_files({
					layout_config = {
						vertical = {
							prompt_position = "top",
							mirror = true,
							preview_cutoff = 0,
						},
						width = 0.9,
						height = 0.9,
					},
					layout_strategy = "vertical",
					sorting_strategy = "ascending",
				})
			end, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>fg", function()
				builtin.live_grep({
					layout_config = {
						vertical = {
							prompt_position = "top",
							mirror = true,
							preview_cutoff = 0,
						},
						width = 0.9,
						height = 0.9,
					},
					layout_strategy = "vertical",
					sorting_strategy = "ascending",
				})
			end, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>fb", function()
				builtin.buffers({
					layout_config = {
						vertical = {
							prompt_position = "top",
							mirror = true,
							preview_cutoff = 0,
						},
						width = 0.9,
						height = 0.9,
					},
					layout_strategy = "vertical",
					sorting_strategy = "ascending",
				})
			end, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>fh", function()
				builtin.help_tags({
					layout_config = {
						vertical = {
							prompt_position = "top",
							mirror = true,
							preview_cutoff = 0,
						},
						width = 0.9,
						height = 0.9,
					},
					layout_strategy = "vertical",
					sorting_strategy = "ascending",
				})
			end, { desc = "Telescope help tags" })
		end,
	},
}
