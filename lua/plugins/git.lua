return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
				current_line_blame_opts = {
					delay = 100, -- Set delay to 100ms -> fasssssstttt (default is 1000ms)
				},
			})
		end,
	},
	{
		"tpope/vim-fugitive",
	},
}
