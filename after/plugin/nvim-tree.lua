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
	hijack_directories = {
		enable = true,
	},
})

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>e", "<CMD>NvimTreeToggle<CR>", opts)
vim.keymap.set("n", "<leader>o", "<CMD>NvimTreeFindFile<CR>", opts)
