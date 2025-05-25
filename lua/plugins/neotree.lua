return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	lazy = false, -- neo-tree will lazily load itself
	opts = {
		-- fill any relevant options here
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					hide_dotfiles = false, -- Default is `true`. Change this to `false` to show hidden files.
					hide_gitignored = false, -- Optionally show files ignored by `.gitignore`
				},
			},
		})
	end,
}
