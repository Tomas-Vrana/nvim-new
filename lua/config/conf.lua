-- Do not convert tabs to spaces
vim.cmd("set noexpandtab")

-- Set the display width of a tab character to 4 spacesinit
vim.cmd("set tabstop=4")

-- Set the number of spaces a Tab key press inserts in insert mode
vim.cmd("set softtabstop=4")

-- Set the indentation width to 4 spaces
vim.cmd("set shiftwidth=4")

-- Enable line numbers and relative
vim.opt.relativenumber = true
vim.opt.number = true

-- ##################
-- MUST BE LOADED BEFORE LAZY
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- ##################

--set minimum visible lines
vim.o.scrolloff = 8

-- open new window on right
vim.o.splitright = true

-- Disable swap and backup files
vim.opt.swapfile = false
vim.opt.backup = false

-- Set undo directory and enable persistent undo
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Disable persistent highlight for search
vim.opt.hlsearch = false

-- Display search result as user types
vim.opt.incsearch = true

vim.opt.ignorecase = true

-- /test → matches test, Test, TEST, etc. (case-insensitive)
-- /Test → matches only Test (case-sensitive)
vim.opt.smartcase = true

-- enable 24-bit color terminal support
vim.opt.termguicolors = true

-- time to activate CursorHold (user no interaction time), triggers diagnostic, popups ...
vim.opt.updatetime = 50

-- Set color column at 100 characters
vim.opt.colorcolumn = "100"

--the thing on left where things like gitstatus and lsp is
vim.opt.signcolumn = "yes"
vim.g.editorconfig = true
