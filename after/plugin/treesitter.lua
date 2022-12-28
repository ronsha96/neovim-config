require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = false,
	},
	sync_install = false,
	auto_install = true,
	indent = {
		enable = true,
		disable = {},
	},
	ensure_installed = {
		"help",
		"javascript",
		"typescript",
		"tsx",
		"toml",
		"fish",
		"php",
		"json",
		"yaml",
		"swift",
		"css",
		"html",
		"lua",
	},
	autotag = {
		enable = true,
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>no", "<CMD>NvimTreeOpen<CR>", opts)
vim.keymap.set("n", "<leader>nc", "<CMD>NvimTreeClose<CR>", opts)
vim.keymap.set("n", "<leader>nf", "<CMD>NvimTreeFindFile<CR>", opts)
