return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = function()
		require("tokyonight").setup({
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		})
		vim.cmd([[colorscheme tokyonight-night]])
	end,
}
