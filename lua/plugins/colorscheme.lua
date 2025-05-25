return {
{
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
		--sets up default colorscheme for some plugins and nvim
		config = function()
			vim.cmd("colorscheme tokyonight")
		end,

}}
