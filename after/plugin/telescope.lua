local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

telescope.setup({
	defaults = {
		path_display = { "truncate" },
		file_ignore_patterns = {
			"node_modules",
			"build",
			"dist",
			"yarn.lock",
		},
		mappings = {
			n = {
				["q"] = actions.close,
			},
		},
		history = {
			path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
			limit = 100,
		},
		preview = {
			filesize_hook = function(filepath, bufnr, opts)
				local max_bytes = 10000
				local cmd = { "head", "-c", max_bytes, filepath }
				require("telescope.previewers.utils").job_maker(cmd, bufnr, opts)
			end,
		},
	},
})

-- Extensions
telescope.load_extension("smart_history")
telescope.load_extension("frecency")
telescope.load_extension("refactoring")

-- Mappings
vim.keymap.set("n", ";f", function()
	builtin.find_files({
		no_ignore = false,
		hidden = true,
	})
end)

vim.keymap.set("n", ";g", function()
	telescope.extensions.frecency.frecency()
end)

local function get_visual_selection()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg("v")
	vim.fn.setreg("v", {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ""
	end
end

vim.keymap.set({ "n", "v" }, ";r", function()
	local selected_text = get_visual_selection()
	builtin.live_grep({ default_text = selected_text })
end)

vim.keymap.set("n", "\\\\", function()
	builtin.buffers()
end)

vim.keymap.set("n", ";t", function()
	builtin.colorscheme()
end)

vim.keymap.set("n", ";;", function()
	builtin.resume()
end)

vim.keymap.set("n", ";e", function()
	builtin.diagnostics()
end)

vim.keymap.set("v", "<leader>rr", function()
	telescope.extensions.refactoring.refactors()
end)
