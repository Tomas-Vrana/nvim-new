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
				window = {
					mappings = {
						["o"] = "system_open",
					},
				},
				commands = {
					system_open = function(state)
						local node = state.tree:get_node()
						local path = node:get_id()
						-- Linux: open file in default application
						vim.fn.jobstart({ "wslview", path }, { detach = true })

						-- Windows: Without removing the file from the path, it opens in code.exe instead of explorer.exe
						-- local p
						-- local lastSlashIndex = path:match("^.+()\\[^\\]*$") -- Match the last slash and everything before it
						-- if lastSlashIndex then
						-- 	p = path:sub(1, lastSlashIndex - 1) -- Extract substring before the last slash
						-- else
						-- 	p = path -- If no slash found, return original path
						-- end
						-- vim.cmd("silent !start explorer " .. p)
					end,
				},
			},
		})
	end,
}
