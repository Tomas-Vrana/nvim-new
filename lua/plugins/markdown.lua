return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		lazy = true,
		ft = { "markdown" },
	},
	{

		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("obsidian").setup({
				ui = {
					enable = true,
				},
				workspaces = {
					{
						name = "personal",
						path = vim.fn.expand("~/Projects/notes/"),
					},
				},
				follow_url_func = function(url)
					-- Open the URL in the default web browser.
					vim.fn.jobstart({ "wslview", url }) -- Mac OS
				end,
			})
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function()
					vim.opt_local.conceallevel = 2
				end,
			})
		end,
	},
}
