require("nvim-tree").setup({
	renderer = {
		full_name = true,
	},
})

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>no", "<CMD>NvimTreeOpen<CR>", opts)
vim.keymap.set("n", "<leader>nc", "<CMD>NvimTreeClose<CR>", opts)
vim.keymap.set("n", "<leader>nf", "<CMD>NvimTreeFindFile<CR>", opts)

vim.cmd([[ NvimTreeOpen ]]) -- open tree on startup
