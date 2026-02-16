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
