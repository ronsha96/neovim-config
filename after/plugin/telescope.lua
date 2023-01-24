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
	pickers = {
		find_files = {
			theme = "dropdown",
		},
		live_grep = {
			theme = "dropdown",
		},
		buffers = {
			theme = "dropdown",
		},
		colorscheme = {
			theme = "dropdown",
		},
		diagnostics = {
			theme = "dropdown",
		},
	},
})

-- Extensions
telescope.load_extension("fzy_native")
telescope.load_extension("smart_history")
telescope.load_extension("refactoring")
telescope.load_extension("textcase")

-- Mappings
vim.keymap.set("n", ";f", function()
	builtin.find_files({
		no_ignore = false,
		hidden = true,
	})
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
	builtin.live_grep({
		default_text = selected_text,
		theme = dropdown_theme,
	})
end)

vim.keymap.set("n", "\\\\", function()
	builtin.buffers({
		theme = dropdown_theme,
	})
end)

vim.keymap.set("n", ";t", function()
	builtin.colorscheme({
		theme = dropdown_theme,
	})
end)

vim.keymap.set("n", ";;", function()
	builtin.resume({
		theme = dropdown_theme,
	})
end)

vim.keymap.set("n", ";e", function()
	builtin.diagnostics({
		theme = dropdown_theme,
	})
end)

vim.keymap.set("n", ";x", "<CMD>TextCaseOpenTelescope<CR>", { desc = "Telescope" })
vim.keymap.set("v", ";x", "<CMD>TextCaseOpenTelescope<CR>", { desc = "Telescope" })

vim.keymap.set("v", "<leader>rr", function()
	telescope.extensions.refactoring.refactors()
end)
