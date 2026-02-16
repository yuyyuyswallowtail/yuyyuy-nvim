vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Relative line numbers for easier jumping
vim.opt.mouse = "a" -- Enable mouse support
vim.opt.ignorecase = true -- Case-insensitive searching
vim.opt.smartcase = true -- Smart search (case-sensitive if capital used)
vim.opt.termguicolors = true -- Better color support
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.tabstop = 2 -- Number of spaces tabs count for
vim.opt.smartindent = true -- Insert indents automatically
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.termguicolors = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

vim.o.clipboard = "unnamedplus"

vim.g.clipboard = {
	name = "win32yank",
	copy = {
		["+"] = "win32yank.exe -i --crlf",
		["*"] = "win32yank.exe -i --crlf",
	},
	paste = {
		["+"] = "win32yank.exe -o --lf",
		["*"] = "win32yank.exe -o --lf",
	},
	cache_enabled = 0,
}
