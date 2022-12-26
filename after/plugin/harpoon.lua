local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local map = vim.keymap.set
local opts = { noremap = true, silent = false }

map("n", "<leader>a", mark.add_file, opts)

map("n", "<C-e>", ui.toggle_quick_menu, opts)

map("n", "<leader>m,", function()
	ui.nav_file(1)
end, opts)

map("n", "<leader>m.", function()
	ui.nav_file(2)
end, opts)

map("n", "<leader>m/", function()
	ui.nav_file(3)
end, opts)

map("n", "<leader>mm", function()
	ui.nav_file(4)
end, opts)
