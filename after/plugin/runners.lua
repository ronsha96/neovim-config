local opts = { noremap = true }

-- Run
local overseer = require("overseer")

overseer.setup({
	-- strategy = "toggleterm",
	task_list = {
		default_detail = 2,
		min_width = { 60, 0.15 },
		direction = "right",
	},
})

overseer.register_template({
	name = "Python: Run main.py",
	builder = function(_)
		return {
			cmd = { "./venv/bin/python" },
			args = { "main.py" },
		}
	end,
	desc = "Runs the python project inside a virtual environment",
	priority = 0,
	condition = {
		dir = { "/Users/ronsha/dev/pymobiengine" },
	},
})

vim.keymap.set("n", "'xx", "<Cmd>OverseerRun<CR>", opts)
vim.keymap.set("n", "'x'", "<Cmd>OverseerToggle<CR>", opts)

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
	consumers = {
		overseer = require("neotest.consumers.overseer"),
	},
})

-- Run nearest test
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
