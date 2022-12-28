local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local opts = { noremap = true, silent = false }

vim.keymap.set("n", "ma", mark.add_file, opts)
vim.keymap.set("n", "mm", ui.toggle_quick_menu, opts)

for n = 1, 9 do
	vim.keymap.set("n", "m" .. n, function()
		ui.nav_file(n)
	end, opts)
end
