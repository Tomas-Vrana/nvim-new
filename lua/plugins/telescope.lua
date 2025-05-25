return {
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },

		config = function()
			local actions = require("telescope.actions")
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					file_ignore_patterns = {
						"%.git/", -- Ignore .git directory
						"node_modules/", -- Ignore node_modules
						"build/", -- Ignore build directories
						"dist/", -- Ignore dist directories
						"target/", -- Ignore Rust/Java targets
						"%.lock", -- Ignore lock files
						"%.zip", -- Ignore zip archives
						"%.tar.gz", -- Ignore tarballs
						"%.class", -- Ignore Java compiled files
						"%.o", -- Ignore object files
						"%.so", -- Ignore shared objects
						"__pycache__/", -- Ignore Python cache
						"%.pyc", -- Ignore compiled Python
						"%.DS_Store", -- macOS system files
						"%.min.js", -- Ignore minified JS
						"%.min.css", -- Ignore minified CSS
					},
					hidden = true,
				},
				pickers = {
					find_files = {
						hidden = true,
					},
				},
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					},
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
				mappings = {
					i = {
						["<C-l>"] = actions.cycle_history_next,
						["<C-h>"] = actions.cycle_history_prev,

						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
				},
			})
			telescope.load_extension("fzf")
			telescope.load_extension("ui-select")
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
}
