return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").setup({
				ensure_installed = {
					"c",
					"astro",
					"css",
					"html",
					"javascript",
					"typescript",
					"tsx",
					"svelte",
					"vue",
					"go",
					"gomod",
					"gosum",
					"gowork",
					"python",
					"bash",
					"lua",
					"json",
					"toml",
					"yaml",
					"markdown",
					"markdown_inline",
					"query",
					"regex",
					"vim",
					"vimdoc",
					"latex",
					"norg",
					"scss",
					"typst",
					"sql",
					"prisma",
				},
				sync_install = false,
				auto_install = true, -- auto install missing parsers when entering buffer
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = true,
				},
			})
		end,
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = false,
				},
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = function(_, opts)
			-- Other blankline configuration here
			return require("indent-rainbowline").make_opts(opts)
		end,
		dependencies = {
			"TheGLander/indent-rainbowline.nvim",
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
	},
}
