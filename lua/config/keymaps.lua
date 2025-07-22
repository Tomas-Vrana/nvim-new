--###############################
--GENERAL VIM REMAPS
--###############################

-- Remap `kj` to `Esc` in insert mode
vim.api.nvim_set_keymap("i", "kj", "<Esc>", { noremap = true, silent = true })

-- Map ZZ to save the current file
vim.keymap.set("n", "zz", ":update<CR>", {})

-- Keeps cursor on the same line after J
vim.keymap.set("n", "J", "mzJ`z")

-- center screen after
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- disable
vim.keymap.set("n", "Q", "<nop>")

-- global rename
vim.keymap.set("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- paste over selection without changing buffer
vim.keymap.set("x", "<leader>p", '"_dP')

-- Map Ctrl + directional keys to navigate between windows
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

--allows block indenting without the need for re-selection
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

--highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

--window management
--split Window Vertical
vim.keymap.set("n", "<leader>wv", "<C-w>v")
--split Window Horizontal
vim.keymap.set("n", "<leader>wh", "<C-w>s")
--split Window Equal size
vim.keymap.set("n", "<leader>we", "<C-w>=")
--Window eXit
vim.keymap.set("n", "<leader>wx", "<cmd>close<CR>")

--copy file path to clipboard
vim.keymap.set("n", "<leader>fp", function()
	local filePath = vim.fn.expand("%:~")
	vim.fn.setreg("+", filePath)
end)

-- surround anything selected
-- vim.api.nvim_set_keymap("x", "{", 'c{<C-r>"}<Esc>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("x", "}", 'c{<C-r>"}<Esc>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("x", "[", 'c[<C-r>"]<Esc>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("x", "]", 'c[<C-r>"]<Esc>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("x", "(", 'c(<C-r>")<Esc>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("x", ")", 'c(<C-r>")<Esc>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("x", '"', 'c"<C-r>""<Esc>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("x", "'", "c'<C-r>\"'<Esc>", { noremap = true, silent = true })

-- start in :!
vim.api.nvim_set_keymap("n", "<leader>;", ":!", { noremap = true })

-- open result in new buffer
-- FIX maybe not needed
vim.api.nvim_set_keymap(
	"n",
	"<leader>:",
	":vnew | setlocal buftype=nofile bufhidden=wipe noswapfile |:r! ",
	{ noremap = true, silent = false }
)

-- turn horizontal split into vertical
vim.keymap.set("n", "<leader>gv", function()
	local buf = vim.api.nvim_get_current_buf()
	vim.cmd("close") -- close current window
	vim.cmd("vsplit") -- open vertical split
	vim.api.nvim_set_current_buf(buf) -- reassign the buffer
end, { desc = "Turn split into vertical", silent = true })

vim.keymap.set("n", "<leader>e", function()
	vim.fn.jobstart("wslview .", { detach = true })
end, { desc = "open windows system file explorer" })

vim.keymap.set("n", "gm", function()
	vim.cmd("Man " .. vim.fn.expand("<cword>"))
end, { desc = "open manpage for word under cursor" })

--###############################
--PLUGINS REMAPS
--###############################

-- TELESCOPE
----------------
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Find files in cwd" })
vim.keymap.set("n", "<leader>sa", function()
	builtin.find_files({ cwd = "/home/xvranat00/" })
end, { desc = "Find all files in root" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Grep through files in cwd" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Grep word under cursor" })
vim.keymap.set("n", "<leader>se", function()
	vim.cmd("TodoTelescope")
end, { desc = "Search TODO, FIX, ERROR" })
vim.keymap.set("n", "<leader>st", builtin.tags, { desc = "Search Tags (ctags)" })
vim.keymap.set("n", "<leader>sc", builtin.commands, { desc = "Search Neovim commands" })
vim.keymap.set("n", "<leader>sq", builtin.quickfix, { desc = "Search quickfix list" })
vim.keymap.set("n", "<leader>sv", builtin.vim_options, { desc = "Search Vim options" })
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search Neovim help" })
vim.keymap.set("n", "<leader>sm", builtin.man_pages, { desc = "Search Man pages" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search Keymaps" })
vim.keymap.set("n", "<leader>sr", builtin.registers, { desc = "Search Registers" })
vim.keymap.set("n", "\\", builtin.resume, { desc = "Resume last Telescope picker" })

-- Git-related searches
vim.keymap.set("n", "<leader>gg", builtin.git_files, { desc = "Search Git-tracked files" })
vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Search Git commits (cwd)" })
vim.keymap.set("n", "<leader>gl", builtin.git_bcommits, { desc = "Search Git commits (buffer)" })
vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Search Git branches" })
vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Search Git status" })

local actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				--cycle telescope history
				["<C-l>"] = actions.cycle_history_next,
				--cycle telescope history
				["<C-h>"] = actions.cycle_history_prev,

				--move down in telescope window
				["<C-j>"] = actions.move_selection_next,
				--move up in telescope window
				["<C-k>"] = actions.move_selection_previous,
				--close telescope window
				["kj"] = "close",
			},
		},
	},
})

-- NEOTREE
----------
--Toggle neotree
vim.keymap.set("n", "<leader>t", ":Neotree toggle position=current<CR>")

--LSP
---------
--Go Hover
vim.keymap.set("n", "gh", vim.lsp.buf.hover, {})
--Go Definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
--Go Auto-fix
vim.keymap.set("n", "ga", vim.lsp.buf.code_action, {})
--Format (Format)
vim.keymap.set("n", "ff", vim.lsp.buf.format, {})
--Go Error
vim.api.nvim_set_keymap("n", "ge", "<cmd>lua vim.diagnostic.open_float()<CR>", {})

--HARPOON
---------
local harpoon = require("harpoon")
--Add to harpoon list
vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end)
--show Harpoon list
vim.keymap.set("n", "<leader>h", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

--first harpoon file
vim.keymap.set("n", "ě", function()
	harpoon:list():select(1)
end)
--second harpoon file
vim.keymap.set("n", "š", function()
	harpoon:list():select(2)
end)
--third harpoon file
vim.keymap.set("n", "č", function()
	harpoon:list():select(3)
end)
--last harpoon file
vim.keymap.set("n", "ř", function()
	harpoon:list():select(4)
end)

-- Toggle previous buffer stored within Harpoon list
vim.keymap.set("n", "<leader>j", function()
	harpoon:list():prev()
end)
-- Toggle next buffer stored within Harpoon list
vim.keymap.set("n", "<leader>k", function()
	harpoon:list():next()
end)

--UNDOTREE
----------
--toggle Undotree
vim.keymap.set("n", "<leader>u", function()
	vim.cmd("UndotreeToggle")
	vim.cmd("wincmd p")
end)

--HARPER_LS
------------

function EnableHarperLS()
	for _, client in ipairs(vim.lsp.get_clients()) do
		if client.name ~= "harper_ls" then
			vim.cmd("LspStart harper_ls")
			print("Harper LS diagnostics enabled")
		end
	end
end

function DisableHarperLS()
	for _, client in ipairs(vim.lsp.get_clients()) do
		if client.name == "harper_ls" then
			vim.cmd("LspStop harper_ls")
			print("Harper LS diagnostics disabled")
		end
	end
end

--toggle Harper
vim.api.nvim_set_keymap("n", "<Leader>eh", ":lua EnableHarperLS()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<Leader>dh", ":lua DisableHarperLS()<CR>", { noremap = true, silent = true })
--GIT
-------------
vim.keymap.set("n", "gp", ":Gitsigns preview_hunk<CR>", {})

local gitsigns = require("gitsigns")
vim.keymap.set("n", "<leader>gh", gitsigns.stage_hunk, { desc = "Git stage hunk" })

--open Git Fugitive
vim.keymap.set("n", "<leader>gf", vim.cmd.Git)

--TODO COMMENTS
---------------
vim.keymap.set("n", "<leader>en", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "<leader>ep", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

--MARKDOWN PREVIEW
----------------
local mk_preview_enabled = false
vim.keymap.set("n", "<leader>mp", function()
	if mk_preview_enabled then
		vim.cmd("MarkdownPreviewStop")
		mk_preview_enabled = not mk_preview_enabled
	else
		vim.cmd("MarkdownPreview")
		mk_preview_enabled = not mk_preview_enabled
	end
end, { desc = "toggle MarkdownPreview" })

--LUASNIP
---------
local ls = require("luasnip")
vim.keymap.set({ "i", "s" }, "<Tab>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	else
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", true)
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	else
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<S-Tab>", true, false, true), "n", true)
	end
end, { silent = true })
