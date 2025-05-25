return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				-- ... your lualine config
				theme = "tokyonight",
				icons_enabled = true,
				-- ... your lualine config
			},
		})
	end,
}
