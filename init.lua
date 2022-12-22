-- plugins
require("plugins")

-- general vim initialization commands
vim.cmd([[
  set autoread
]])

-- auto compile plugins
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- nvim tree
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- theme
do
	---@diagnostic disable-next-line: unused-function, unused-local
	local function theme_gruvbox()
		require("gruvbox").setup({ contrast = "dark", italics = false })
		vim.cmd([[colorscheme gruvbox]])
	end

	---@diagnostic disable-next-line: unused-function, unused-local
	local function theme_ayu()
		local mirage = false
		local colors = require("ayu.colors")
		colors.generate(mirage)

		local ayu = require("ayu")

		ayu.setup({
			mirage = mirage,
			overrides = function()
				return { Comment = { fg = colors.comment } }
			end,
		})

		ayu.colorscheme()
	end

	---@diagnostic disable-next-line: unused-function, unused-local
	local function theme_no_clown_fiesta()
		vim.cmd([[colorscheme no-clown-fiesta]])
	end

	---@diagnostic disable-next-line: unused-function, unused-local
	local function theme_nightfox()
		require("nightfox").setup()
		-- vim.cmd([[colorscheme nightfox]])
		-- vim.cmd([[colorscheme duskfox]])
		vim.cmd([[colorscheme nordfox]])
		-- vim.cmd([[colorscheme terafox]])
	end

	-- setup_gruvbox()
	-- theme_ayu()
	-- theme_no_clown_fiesta()
	theme_nightfox()
end

-- status line
require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "nordfox",
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		disabled_filetypes = {},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = {
			{
				"filename",
				file_status = true, -- displays file status (readonly status, modified status)
				path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
			},
			"lsp_progress",
		},
		lualine_x = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
			},
			"encoding",
			"filetype",
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			{
				"filename",
				file_status = true, -- displays file status (readonly status, modified status)
				path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
			},
		},
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { "fugitive" },
})

require("fidget").setup()

-- options
vim.o.termguicolors = true

vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.backspace = "indent,start,eol"
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.joinspaces = true
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 8
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.expandtab = false
vim.opt.autoindent = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.splitbelow = true
vim.opt.splitright = true

-- remappings
vim.g.mapleader = " "

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<Space>", "<Nop>", opts)

-- unmap arrow keys
map("n", "<Up>", "<Nop>", opts)
map("n", "<Down>", "<Nop>", opts)
map("n", "<Left>", "<Nop>", opts)
map("n", "<Right>", "<Nop>", opts)

map("i", "<Up>", "<Nop>", opts)
map("i", "<Down>", "<Nop>", opts)
map("i", "<Left>", "<Nop>", opts)
map("i", "<Right>", "<Nop>", opts)

map("v", "<Up>", "<Nop>", opts)
map("v", "<Down>", "<Nop>", opts)
map("v", "<Left>", "<Nop>", opts)
map("v", "<Right>", "<Nop>", opts)

-- yank all
map("n", "<leader>y", 'ggVG"+y', opts)

-- window mappings
map("n", "<c-h>", "<c-w>h", opts)
map("n", "<c-j>", "<c-w>j", opts)
map("n", "<c-k>", "<c-w>k", opts)
map("n", "<c-l>", "<c-w>l", opts)

-- cancel highlight
map("n", "/\\", ":noh<cr>", opts)

-- Move to previous/next
map("n", "<leader>t,", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<leader>t.", "<Cmd>BufferNext<CR>", opts)
-- Re-order to previous/next
map("n", "<leader>t<", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<leader>t>", "<Cmd>BufferMoveNext<CR>", opts)
-- Goto buffer in position...
map("n", "<leader>t1", "<Cmd>BufferGoto 1<CR>", opts)
map("n", "<leader>t2", "<Cmd>BufferGoto 2<CR>", opts)
map("n", "<leader>t3", "<Cmd>BufferGoto 3<CR>", opts)
map("n", "<leader>t4", "<Cmd>BufferGoto 4<CR>", opts)
map("n", "<leader>t5", "<Cmd>BufferGoto 5<CR>", opts)
map("n", "<leader>t6", "<Cmd>BufferGoto 6<CR>", opts)
map("n", "<leader>t7", "<Cmd>BufferGoto 7<CR>", opts)
map("n", "<leader>t8", "<Cmd>BufferGoto 8<CR>", opts)
map("n", "<leader>t9", "<Cmd>BufferGoto 9<CR>", opts)
map("n", "<leader>t0", "<Cmd>BufferLast<CR>", opts)
-- Pin/unpin buffer
map("n", "<c-p>", "<Cmd>BufferPin<CR>", opts)
-- Close buffer
map("n", "<leader>tc", "<Cmd>BufferClose<CR>", opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
-- Sort automatically by...
map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

-- multi vim patch for mac
map("n", "<C-S-Down>", "<C-Down>", {})
map("n", "<C-S-Up>", "<C-Up>", {})

-- languages
local lsp = require("lspconfig")
local protocol = require("vim.lsp.protocol")

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gs", vim.lsp.buf.definition, bufopts)
	-- vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	-- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
	-- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gR", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<leader>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)

	local saga = require("lspsaga")
	saga.init_lsp_saga({
		server_filetype_map = {
			typescript = "typescript",
		},
	})

	vim.keymap.set("n", "[d", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)
	vim.keymap.set("n", "]d", "<Cmd>Lspsaga diagnostic_jump_next<CR>", bufopts)
	vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", bufopts)
	vim.keymap.set("n", "gd", "<Cmd>Lspsaga lsp_finder<CR>", bufopts)
	vim.keymap.set("i", "<C-k>", "<Cmd>Lspsaga signature_help<CR>", bufopts)
	vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", bufopts)
	vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>", bufopts)
	vim.keymap.set("n", "<leader>ca", "<Cmd>Lspsaga code_action<CR>", bufopts)
end

local null_ls = require("null-ls")

null_ls.setup({
	on_attach = function(client, bufnr)
		local bufopts = { noremap = true, silent = true, buffer = bufnr }

		if client.server_capabilities.documentFormattingProvider then
			vim.keymap.set("n", "<leader>f", function()
				vim.lsp.buf.format({ async = true })
			end, bufopts)
		end
	end,
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettierd,

		null_ls.builtins.diagnostics.eslint_d,
		-- null_ls.builtins.diagnostics.cspell,
		-- null_ls.builtins.diagnostics.tsc,

		null_ls.builtins.code_actions.eslint_d,
		-- null_ls.builtins.code_actions.cspell,
	},
})

-- tree sitter
require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = {},
	},
	ensure_installed = {
		"tsx",
		"toml",
		"fish",
		"php",
		"json",
		"yaml",
		"swift",
		"css",
		"html",
		"lua",
	},
	autotag = {
		enable = true,
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

-- Set up nvim-cmp.
local cmp = require("cmp")
local lspkind = require("lspkind")
local luasnip = require("luasnip")

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-,>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "buffer" },
	}),
	formatting = {
		format = lspkind.cmp_format({ with_text = false, maxwidth = 50 }),
	},
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

vim.cmd([[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]])

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end

-- TypeScript LSP
lsp.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	init_options = {
		preferences = {
			importModuleSpecifierPreference = "relative",
		},
	},
	commands = {
		OrganizeImports = {
			organize_imports,
			description = "Organize Imports",
		},
	},
})

-- CSS LSP
lsp.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "vscode-css-language-server", "--stdio" },
})

-- Lua lsp
lsp.sumneko_lua.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

-- icons
require("nvim-web-devicons").setup({})

-- telescope
local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup({
	defaults = {
		path_display = { "smart" },
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
		-- find_files = {
		-- 	theme = "dropdown",
		-- },
		-- frecency = {
		-- 	theme = "dropdown",
		-- },
		-- buffers = {
		-- 	theme = "dropdown",
		-- },
	},
})

telescope.load_extension("smart_history")
telescope.load_extension("frecency")

-- keymaps
vim.keymap.set("n", ";f", function()
	builtin.find_files({
		no_ignore = false,
		hidden = true,
	})
end)
vim.keymap.set("n", ";g", function()
	telescope.extensions.frecency.frecency()
end)
vim.keymap.set("n", ";r", function()
	builtin.live_grep()
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

-- Git stuff
require("git-conflict").setup()
require("gitsigns").setup()

require("git").setup({
	keymaps = {
		-- Open blame window
		blame = "<Leader>gb",
		-- Open file/folder in git repository
		browse = "<Leader>go",
	},
})

require("nvim-tree").setup()
vim.cmd([[ NvimTreeOpen ]]) -- open tree on startup

--refactoring
require("refactoring").setup({})

-- Remaps for the refactoring operations currently offered by the plugin
map(
	"v",
	"<leader>re",
	[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
	{ noremap = true, silent = true, expr = false }
)
map(
	"v",
	"<leader>rf",
	[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
	{ noremap = true, silent = true, expr = false }
)
map(
	"v",
	"<leader>rv",
	[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
	{ noremap = true, silent = true, expr = false }
)
map(
	"v",
	"<leader>ri",
	[[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
	{ noremap = true, silent = true, expr = false }
)

-- Extract block doesn't need visual mode
map(
	"n",
	"<leader>rb",
	[[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]],
	{ noremap = true, silent = true, expr = false }
)
map(
	"n",
	"<leader>rbf",
	[[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]],
	{ noremap = true, silent = true, expr = false }
)

-- Inline variable can also pick up the identifier currently under the cursor without visual mode
map(
	"n",
	"<leader>ri",
	[[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
	{ noremap = true, silent = true, expr = false }
)

-- load refactoring Telescope extension
telescope.load_extension("refactoring")

-- remap to open the Telescope refactoring menu in visual mode
map("v", "<leader>rr", "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", { noremap = true })
