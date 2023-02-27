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
			-- -- Mapping <Esc> to quit in insert mode
			-- i = {
			-- 	["<esc>"] = actions.close,
			-- },
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
			mime_hook = function(filepath, bufnr, opts)
				local is_image = function(filepath)
					local image_extensions = { "png", "jpg" } -- Supported image formats
					local split_path = vim.split(filepath:lower(), ".", { plain = true })
					local extension = split_path[#split_path]
					return vim.tbl_contains(image_extensions, extension)
				end

				if is_image(filepath) then
					local term = vim.api.nvim_open_term(bufnr, {})
					local function send_output(_, data, _)
						for _, d in ipairs(data) do
							vim.api.nvim_chan_send(term, d .. "\r\n")
						end
					end

					vim.fn.jobstart({
						"catimg",
						filepath, -- Terminal image viewer command
					}, { on_stdout = send_output, stdout_buffered = true, pty = true })
				else
					require("telescope.previewers.utils").set_preview_message(
						bufnr,
						opts.winid,
						"Binary cannot be previewed"
					)
				end
			end,
		},
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--trim",
		},
	},
	pickers = {
		find_files = {
			theme = "dropdown",
		},
		git_files = {
			theme = "dropdown",
		},
		live_grep = {
			theme = "dropdown",
		},
		grep_string = {
			theme = "dropdown",
		},
		commands = {
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
telescope.load_extension("ui-select")

-- Mappings
vim.keymap.set("n", ";f", function()
	builtin.git_files({
		no_ignore = false,
		hidden = true,
	})
end)

vim.keymap.set("n", ";d", function()
	builtin.find_files({
		no_ignore = false,
		hidden = true,
	})
end)

vim.keymap.set({ "n", "v" }, ";r", function()
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

	local selected_text = get_visual_selection()
	builtin.live_grep({
		default_text = selected_text,
	})
end)

vim.keymap.set("n", ";w", function()
	builtin.grep_string({})
end)

vim.keymap.set("n", ";c", function()
	builtin.commands({})
end)

vim.keymap.set("n", ";t", function()
	builtin.colorscheme({})
end)

vim.keymap.set("n", ";o", function()
	builtin.oldfiles({})
end)

vim.keymap.set("n", ";p", function()
	telescope.extensions.project.project({ display_type = "full" })
end)

vim.keymap.set("n", ";;", function()
	builtin.resume({})
end)

vim.keymap.set("n", ";e", function()
	builtin.diagnostics({})
end)

vim.keymap.set({ "n", "v" }, ";x", "<CMD>TextCaseOpenTelescope<CR>", { desc = "Telescope" })

vim.keymap.set("v", "<leader>rr", function()
	telescope.extensions.refactoring.refactors()
end)
