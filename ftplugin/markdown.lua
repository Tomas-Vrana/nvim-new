-- This runs only for markdown files
-- vim.opt_local.wrap = true -- Enable visual wrapping
vim.opt_local.linebreak = true -- Wrap only at word boundaries
vim.opt_local.showbreak = "↪ " -- Visual indicator of wrapped lines
vim.opt_local.colorcolumn = "100" -- Show marker at column 100
vim.opt_local.textwidth = 100 -- Auto-format line length target
-- vim.opt_local.formatoptions:append("t") -- Use textwidth when formatting
-- vim.opt_local.formatoptions:append("a")
-- vim.opt_local.formatoptions:append("t") -- Auto-wrap when formatting
-- vim.opt_local.formatoptions:append("c") -- Auto-wrap comments too (optional)
-- vim.opt_local.formatoptions:append("q") -- Allow formatting with gq
-- vim.opt_local.formatoptions:append("n") -- Recognize numbered lists
-- vim.opt_local.formatoptions:append("1") -- Don't break a single long word
-- vim.opt_local.formatoptions:append("a") -- Auto-wrap text as you type (⚠️ see note below)
vim.opt_local.formatoptions:remove("r") -- dont insert comment leader on new line
vim.opt_local.formatoptions:remove("t") -- dont insert comment leader on new line
vim.opt_local.formatoptions:remove("c") -- dont insert comment leader on new line
vim.opt_local.formatoptions:remove("q") -- dont insert comment leader on new line
vim.opt_local.formatoptions:remove("j") -- dont insert comment leader on new line
