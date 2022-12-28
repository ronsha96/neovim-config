vim.keymap.set(
	"n",
	"<C-S-Up>",
	"<CMD>call vm#commands#add_cursor_up(0, v:count1)<CR>",
	{ noremap = true, silent = true }
)

vim.keymap.set(
	"n",
	"<C-S-Down>",
	"<CMD>call vm#commands#add_cursor_down(0, v:count1)<CR>",
	{ noremap = true, silent = true }
)
