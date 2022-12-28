vim.keymap.set(
	"n",
	"<leader>db",
	"<CMD>BufferCloseAllButPinned<CR>" .. "<CMD>NvimTreeClose<CR>" .. "<CMD>DBUI<CR>",
	{ noremap = false, silent = false }
)
