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
			env = {
				PYTHONUNBUFFERED = 1,
			},
		}
	end,
	desc = "Runs the python project inside a virtual environment",
	priority = 1,
	condition = {
		dir = { "/Users/ronsha/dev/pymobiengine" },
	},
})

overseer.register_template({
	name = "Python: Run current module",
	builder = function(_)
		return {
			cmd = { "python3" },
			args = { "-m", vim.fn.expand("%"):gsub("%.py", ""):gsub("/", ".") },
			env = {
				PYTHONUNBUFFERED = 1,
			},
		}
	end,
	priority = 0,
	condition = {
		filetype = { "py", "python" },
	},
})

overseer.register_template({
	name = "Python: Run current file",
	builder = function(_)
		return {
			cmd = { "python3" },
			args = { vim.fn.expand("%") },
			env = {
				PYTHONUNBUFFERED = 1,
			},
		}
	end,
	priority = 0,
	condition = {
		filetype = { "py", "python" },
	},
})

vim.api.nvim_create_user_command("OverseerRestartLast", function()
	local tasks = overseer.list_tasks({ recent_first = true })
	if vim.tbl_isempty(tasks) then
		vim.notify("No tasks found", vim.log.levels.WARN)
	else
		overseer.run_action(tasks[1], "restart")
	end
end, {})

vim.keymap.set("n", "'xx", "<Cmd>OverseerRun<CR>", opts)
vim.keymap.set("n", "'xr", "<Cmd>OverseerRestartLast<CR>", opts)
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
	icons = {
		passed = "",
		running = "",
		failed = "",
		unknown = "",
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

-- Debug

local dap_breakpoint = {
	error = {
		text = "🟥",
		texthl = "LspDiagnosticsSignError",
		linehl = "",
		numhl = "",
	},
	rejected = {
		text = "",
		texthl = "LspDiagnosticsSignHint",
		linehl = "",
		numhl = "",
	},
	stopped = {
		text = "⭐️",
		texthl = "LspDiagnosticsSignInformation",
		linehl = "DiagnosticUnderlineInfo",
		numhl = "LspDiagnosticsSignInformation",
	},
}

vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)

require("nvim-dap-virtual-text").setup({
	commented = true,
})

local dap, dapui = require("dap"), require("dapui")

dapui.setup({})

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

-- Debug: lua
dap.configurations.lua = {
	{
		type = "nlua",
		request = "attach",
		name = "Attach to running Neovim instance",
		host = function()
			local value = vim.fn.input("Host [127.0.0.1]: ")
			if value ~= "" then
				return value
			end
			return "127.0.0.1"
		end,
		port = function()
			local val = tonumber(vim.fn.input("Port: ", "54321"))
			assert(val, "Please provide a port number")
			return val
		end,
	},
}

dap.adapters.nlua = function(callback, config)
	callback({ type = "server", host = config.host, port = config.port })
end

-- Debug: Python
require("dap-python").setup("~/.virtualenvs/debugpy/bin/python", {})
table.insert(dap.configurations.python, {
	type = "python",
	request = "launch",
	name = "Launch main.py",
	program = "./main.py",
	python = { "./venv/bin/python" },
})

-- Debug: Mappings
local whichkey = require("which-key")

whichkey.register({
	d = {
		name = "Debug",
		R = {
			function()
				dap.run_to_cursor()
			end,
			"Run to Cursor",
		},
		E = {
			function()
				dapui.eval(vim.fn.input("[Expression] > "))
			end,
			"Evaluate Input",
		},
		C = {
			function()
				dap.set_breakpoint(vim.fn.input("[Condition] > "))
			end,
			"Conditional Breakpoint",
		},
		U = {
			function()
				dapui.toggle()
			end,
			"Toggle UI",
		},
		b = {
			function()
				dap.step_back()
			end,
			"Step Back",
		},
		c = {
			function()
				dap.continue()
			end,
			"Continue",
		},
		d = {
			function()
				dap.disconnect()
			end,
			"Disconnect",
		},
		e = {
			function()
				dapui.eval()
			end,
			"Evaluate",
		},
		g = {
			function()
				dap.session()
			end,
			"Get Session",
		},
		h = {
			function()
				require("dap.ui.widgets").hover()
			end,
			"Hover Variables",
		},
		S = {
			function()
				require("dap.ui.widgets").scopes()
			end,
			"Scopes",
		},
		i = {
			function()
				dap.step_into()
			end,
			"Step Into",
		},
		o = {
			function()
				dap.step_over()
			end,
			"Step Over",
		},
		p = {
			function()
				dap.pause.toggle()
			end,
			"Pause",
		},
		q = {
			function()
				dap.close()
			end,
			"Quit",
		},
		r = {
			function()
				dap.repl.toggle()
			end,
			"Toggle Repl",
		},
		s = {
			function()
				dap.continue()
			end,
			"Start",
		},
		t = {
			function()
				dap.toggle_breakpoint()
			end,
			"Toggle Breakpoint",
		},
		x = {
			function()
				dap.terminate()
			end,
			"Terminate",
		},
		u = {
			function()
				dap.step_out()
			end,
			"Step Out",
		},
	},
}, {
	mode = "n",
	prefix = "<leader>",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = false,
})

whichkey.register({
	name = "Debug",
	e = {
		function()
			dapui.eval()
		end,
		"Evaluate",
	},
}, {
	mode = "v",
	prefix = "<leader>",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = false,
})
