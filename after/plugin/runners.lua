-- Run
require("overseer").setup({})

-- Test
local neotest = require("neotest")

neotest.setup({
	adapters = {
		require("neotest-python")({
			dap = { justMyCode = false },
		}),
		require("neotest-plenary"),
		require("neotest-vim-test")({
			ignore_file_types = { "python", "vim", "lua" },
		}),
	},
})

-- Run nearest test
local opts = { noremap = true }

vim.keymap.set("n", "'tt", function()
	print("Test: Running nearest...")
	neotest.run.run()
end, opts)

vim.keymap.set("n", "'tf", function()
	print("Test: Running file...")
	neotest.run.run(vim.fn.expand("%"))
end, opts)

vim.keymap.set("n", "'td", function()
	print("Test: Debugging nearest...")
	neotest.run.run({ strategy = "dap" })
end, opts)

vim.keymap.set("n", "'tx", function()
	print("Test: Stopping nearest...")
	neotest.run.stop()
end, opts)

vim.keymap.set("n", "'ta", function()
	print("Test: Attaching to nearest...")
	neotest.run.attach()
end, opts)

vim.keymap.set("n", "'to", neotest.output_panel.toggle, opts)
vim.keymap.set("n", "'ts", neotest.summary.toggle, opts)
