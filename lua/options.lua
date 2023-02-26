-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.backspace = "indent,start,eol"
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"

vim.opt.autoread = true
vim.opt.autoindent = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.incsearch = true
vim.opt.hlsearch = true

vim.opt.termguicolors = true

vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.joinspaces = true

vim.opt.cursorline = true

vim.opt.wrap = false

vim.opt.splitbelow = true
vim.opt.splitright = true
