local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local map = vim.keymap.set
local opts = { noremap = true, silent = false }

map("n", "ma", mark.add_file, opts)
map("n", "mm", ui.toggle_quick_menu, opts)

for n = 1, 9 do
	map("n", "m" .. n, function()
		ui.nav_file(n)
	end, opts)
end
