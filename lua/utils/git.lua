require("git-conflict").setup()
require("gitsigns").setup()

require("git").setup({
	keymaps = {
		-- Open blame window
		blame = "<Leader>gb",
		-- Open file/folder in git repository
		browse = "<Leader>go",
	},
})
