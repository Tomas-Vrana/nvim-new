vim.api.nvim_create_autocmd("FileType", {
	pattern = "man",
	callback = function()
		-- L = move current window to the far right
		vim.cmd("wincmd L")
	end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	command = 'silent! normal! g`"zv',
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "fugitive",
	callback = function()
		-- L = move current window to the far right
		vim.cmd("wincmd L")
	end,
})
