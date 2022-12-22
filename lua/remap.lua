local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader
vim.g.mapleader = " "

map("n", "<Space>", "<Nop>", opts)

-- Unmap arrow keys
map("n", "<Up>", "<Nop>", opts)
map("n", "<Down>", "<Nop>", opts)
map("n", "<Left>", "<Nop>", opts)
map("n", "<Right>", "<Nop>", opts)

map("i", "<Up>", "<Nop>", opts)
map("i", "<Down>", "<Nop>", opts)
map("i", "<Left>", "<Nop>", opts)
map("i", "<Right>", "<Nop>", opts)

map("v", "<Up>", "<Nop>", opts)
map("v", "<Down>", "<Nop>", opts)
map("v", "<Left>", "<Nop>", opts)
map("v", "<Right>", "<Nop>", opts)

-- Yank all
map("n", "<leader>y", 'ggVG"+y', opts)

-- Window mappings
map("n", "<c-h>", "<c-w>h", opts)
map("n", "<c-j>", "<c-w>j", opts)
map("n", "<c-k>", "<c-w>k", opts)
map("n", "<c-l>", "<c-w>l", opts)

-- Cancel highlight
map("n", "/\\", ":noh<cr>", opts)

-- Move to previous/next
map("n", "<leader>t,", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<leader>t.", "<Cmd>BufferNext<CR>", opts)

-- Re-order to previous/next
map("n", "<leader>t<", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<leader>t>", "<Cmd>BufferMoveNext<CR>", opts)

-- Goto buffer in position...
map("n", "<leader>t1", "<Cmd>BufferGoto 1<CR>", opts)
map("n", "<leader>t2", "<Cmd>BufferGoto 2<CR>", opts)
map("n", "<leader>t3", "<Cmd>BufferGoto 3<CR>", opts)
map("n", "<leader>t4", "<Cmd>BufferGoto 4<CR>", opts)
map("n", "<leader>t5", "<Cmd>BufferGoto 5<CR>", opts)
map("n", "<leader>t6", "<Cmd>BufferGoto 6<CR>", opts)
map("n", "<leader>t7", "<Cmd>BufferGoto 7<CR>", opts)
map("n", "<leader>t8", "<Cmd>BufferGoto 8<CR>", opts)
map("n", "<leader>t9", "<Cmd>BufferGoto 9<CR>", opts)
map("n", "<leader>t0", "<Cmd>BufferLast<CR>", opts)

-- Pin/unpin buffer
map("n", "<c-p>", "<Cmd>BufferPin<CR>", opts)

-- Close buffer
map("n", "<leader>tc", "<Cmd>BufferClose<CR>", opts)

-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight

-- Magic buffer-picking mode
map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)

-- Sort automatically by...
map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

-- multi vim patch for mac
map("n", "<C-S-Down>", "<C-Down>", { silent = true })
map("n", "<C-S-Up>", "<C-Up>", { silent = true })

map("n", "<leader>e", vim.diagnostic.open_float, opts)
map("n", "<leader>q", vim.diagnostic.setloclist, opts)
