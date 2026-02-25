vim.cmd("filetype plugin indent on")

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
		if lang and pcall(vim.treesitter.get_parser, 0, lang) then
			vim.treesitter.start()
		end
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		-- Disable semantic tokens
		client.server_capabilities.semanticTokensProvider = nil
		-- Disable formatting
		client.server_capabilities.documentFormattingProvider = false
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({
			bufnr = args.buf,
			lsp_fallback = true,
			timeout_ms = 2000,
		})
	end,
})

local function source_matugen()
	local matugen_path = os.getenv("HOME") .. "/.config/nvim/matugen.lua" -- dofile doesn't expand $HOME or ~

	local file, err = io.open(matugen_path, "r")
	if err ~= nil then
		vim.cmd("colorscheme base16-catppuccin-mocha")

		vim.print(
			"A matugen style file was not found, but that's okay! The colorscheme will dynamically change if matugen runs!"
		)
	else
		dofile(matugen_path)
		io.close(file)
	end
end

local function auxiliary_function()
	source_matugen()

	dofile(os.getenv("HOME") .. "/.config/nvim/lua/config/plugins/lualine.lua")

	vim.api.nvim_set_hl(0, "Comment", { italic = true })
end

vim.api.nvim_create_autocmd("Signal", {
	pattern = "SIGUSR1",
	callback = auxiliary_function,
})

vim.cmd("colorscheme matugen")

vim.api.nvim_command("autocmd ColorScheme * highlight Normal ctermbg=None guibg=None")
