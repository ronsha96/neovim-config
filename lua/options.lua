local global = vim.g

-- disable netrw at the very start of your init.lua (strongly advised)
global.loaded_netrw = 1
global.loaded_netrwPlugin = 1

vim.o.termguicolors = true

local opt = vim.opt

opt.completeopt = "menuone,noinsert,noselect"
opt.backspace = "indent,start,eol"
opt.clipboard = "unnamedplus"
opt.autoread = true
opt.number = true
opt.relativenumber = true
opt.incsearch = true
opt.hlsearch = true
opt.hidden = true
opt.ignorecase = true
opt.joinspaces = true
opt.scrolloff = 4
opt.sidescrolloff = 8
opt.shiftround = true
opt.shiftwidth = 4
opt.smartcase = true
opt.smartindent = true
opt.tabstop = 4
opt.expandtab = false
opt.autoindent = true
opt.cursorline = true
opt.wrap = false
opt.splitbelow = true
opt.splitright = true
