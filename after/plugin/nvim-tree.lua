require("nvim-tree").setup({
	git = {
		enable = true,
		ignore = true,
		show_on_dirs = true,
		timeout = 400,
	},
	sort_by = "case_sensitive",
	view = {
		adaptive_size = true,
	},
	renderer = {
		group_empty = true,
		full_name = true,
	},
	update_to_buf_dir = {
		enable = false,
	},
})

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>no", "<CMD>NvimTreeOpen<CR>", opts)
vim.keymap.set("n", "<leader>nc", "<CMD>NvimTreeClose<CR>", opts)
vim.keymap.set("n", "<leader>nf", "<CMD>NvimTreeFindFile<CR>", opts)
