local refactoring = require("refactoring")

refactoring.setup({})

local opts = { noremap = true, silent = true, expr = false }

-- Remaps for the refactoring operations currently offered by the plugin
vim.keymap.set("v", "<leader>re", function()
	refactoring.refactor("Extract Function")
end, opts)

vim.keymap.set("v", "<leader>rf", function()
	refactoring.refactor("Extract Function To File")
end, opts)

vim.keymap.set("v", "<leader>rv", function()
	refactoring.refactor("Extract Variable")
end, opts)

vim.keymap.set("v", "<leader>ri", function()
	refactoring.refactor("Inline Variable")
end, opts)

-- Extract block doesn't need visual mode
vim.keymap.set("n", "<leader>rb", function()
	refactoring.refactor("Extract Block")
end, opts)

vim.keymap.set("n", "<leader>rbf", function()
	refactoring.refactor("Extract Block To File")
end, opts)

-- Inline variable can also pick up the identifier currently under the cursor without visual mode
vim.keymap.set("n", "<leader>ri", function()
	refactoring.refactor("Inline Variable")
end, opts)
