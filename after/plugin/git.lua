local map = vim.keymap.set
local opts = { noremap = true, silent = false }

-- General git tooling
require("git").setup({
	keymaps = {
		default_mappings = false,
		keymaps = {
			-- Open blame window
			blame = "<leader>gb",
			-- Close blame window
			quit_blame = "q",
			-- Open blame commit
			blame_commit = "<CR>",
			-- Open file/folder in git repository
			browse = "<leader>go",
			-- Open pull request of the current branch
			open_pull_request = "<leader>gp",
			-- Create a pull request with the target branch is set in the `target_branch` option
			create_pull_request = "<leader>gn",
			-- Opens a new diff that compares against the current index
			-- diff = "<leader>gd",
			-- Close git diff
			-- diff_close = "<leader>gD",
			-- Revert to the specific commit
			revert = "<leader>gr",
			-- Revert the current file to the specific commit
			revert_file = "<leader>gR",
		},
		-- Default target branch when create a pull request
		target_branch = "master",
	},
})

-- Git conflict
require("git-conflict").setup()

-- Git signs
local gitsigns = require("gitsigns")

gitsigns.setup({
	current_line_blame = true,
})

map("n", "<leader>gB", function()
	gitsigns.blame_line({ full = true })
end, opts)

-- Git UI
local neogit = require("neogit")

neogit.setup({
	kind = "tab",
	integrations = { diffview = true },
})

map("n", "<leader>gs", function()
	neogit.open({ kind = "split" })
end, opts)

map("n", "<leader>ge", ":Neogit cwd=", opts)

-- Diffview stuff
map("n", "<leader>gd", "<CMD>DiffviewOpen<CR>", opts)
map("n", "<leader>gD", "<CMD>DiffviewClose<CR>", opts)
