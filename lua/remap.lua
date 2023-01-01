local opts = { noremap = true, silent = true }

-- Leader
vim.g.mapleader = " "

vim.keymap.set("n", "<Space>", "<Nop>", opts)

-- Unmap arrow keys
vim.keymap.set("n", "<Up>", "<Nop>", opts)
vim.keymap.set("n", "<Down>", "<Nop>", opts)
vim.keymap.set("n", "<Left>", "<Nop>", opts)
vim.keymap.set("n", "<Right>", "<Nop>", opts)

vim.keymap.set("i", "<Up>", "<Nop>", opts)
vim.keymap.set("i", "<Down>", "<Nop>", opts)
vim.keymap.set("i", "<Left>", "<Nop>", opts)
vim.keymap.set("i", "<Right>", "<Nop>", opts)

vim.keymap.set("v", "<Up>", "<Nop>", opts)
vim.keymap.set("v", "<Down>", "<Nop>", opts)
vim.keymap.set("v", "<Left>", "<Nop>", opts)
vim.keymap.set("v", "<Right>", "<Nop>", opts)

-- Yank all
vim.keymap.set("n", "<leader>y", 'ggVG"+y', opts)

-- Window mappings
vim.keymap.set("n", "<c-h>", "<c-w>h", opts)
vim.keymap.set("n", "<c-j>", "<c-w>j", opts)
vim.keymap.set("n", "<c-k>", "<c-w>k", opts)
vim.keymap.set("n", "<c-l>", "<c-w>l", opts)

-- Cancel highlight
vim.keymap.set("n", "/\\", ":noh<cr>", opts)

-- Move to previous/next
vim.keymap.set("n", "<leader>t,", "<Cmd>BufferPrevious<CR>", opts)
vim.keymap.set("n", "<leader>t.", "<Cmd>BufferNext<CR>", opts)

-- Re-order to previous/next
vim.keymap.set("n", "<leader>t<", "<Cmd>BufferMovePrevious<CR>", opts)
vim.keymap.set("n", "<leader>t>", "<Cmd>BufferMoveNext<CR>", opts)

-- Goto buffer in position...
vim.keymap.set("n", "<leader>t1", "<Cmd>BufferGoto 1<CR>", opts)
vim.keymap.set("n", "<leader>t2", "<Cmd>BufferGoto 2<CR>", opts)
vim.keymap.set("n", "<leader>t3", "<Cmd>BufferGoto 3<CR>", opts)
vim.keymap.set("n", "<leader>t4", "<Cmd>BufferGoto 4<CR>", opts)
vim.keymap.set("n", "<leader>t5", "<Cmd>BufferGoto 5<CR>", opts)
vim.keymap.set("n", "<leader>t6", "<Cmd>BufferGoto 6<CR>", opts)
vim.keymap.set("n", "<leader>t7", "<Cmd>BufferGoto 7<CR>", opts)
vim.keymap.set("n", "<leader>t8", "<Cmd>BufferGoto 8<CR>", opts)
vim.keymap.set("n", "<leader>t9", "<Cmd>BufferGoto 9<CR>", opts)
vim.keymap.set("n", "<leader>t0", "<Cmd>BufferLast<CR>", opts)

-- Buffer closing & such
vim.keymap.set("n", "<leader>tc", "<Cmd>BufferClose<CR>", opts)
vim.keymap.set("n", "<leader>bx", "<Cmd>BufferClose<CR>", opts)
vim.keymap.set("n", "<leader>bc", "<Cmd>BufferCloseAllButPinned<CR>", opts)
vim.keymap.set("n", "<leader>bv", "<Cmd>BufferCloseAllButVisible<CR>", opts)

-- Magic buffer-picking mode
vim.keymap.set("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-D>", "<C-D>zz", opts)
vim.keymap.set("n", "<C-U>", "<C-U>zz", opts)

vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)
