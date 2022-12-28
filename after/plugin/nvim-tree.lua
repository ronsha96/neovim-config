require("nvim-tree").setup({
	renderer = {
		full_name = true,
	},
})
vim.cmd([[ NvimTreeOpen ]]) -- open tree on startup
