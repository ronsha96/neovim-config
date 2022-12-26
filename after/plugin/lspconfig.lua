local map = vim.keymap.set

local lsp = require("lspconfig")
-- local protocol = require("vim.lsp.protocol")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	-- map("n", "gD", vim.lsp.buf.declaration, bufopts)
	map("n", "gs", vim.lsp.buf.definition, bufopts)
	-- map("n", "K", vim.lsp.buf.hover, bufopts)
	map("n", "gi", vim.lsp.buf.implementation, bufopts)
	-- map("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	map("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	map("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
	-- map("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	-- map("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	map("n", "gR", vim.lsp.buf.references, bufopts)
	map("n", "<leader>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)

	require("lspsaga").init_lsp_saga({
		server_filetype_map = {
			typescript = "typescript",
		},
	})

	map("n", "[d", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)
	map("n", "]d", "<Cmd>Lspsaga diagnostic_jump_next<CR>", bufopts)
	map("n", "K", "<Cmd>Lspsaga hover_doc<CR>", bufopts)
	map("n", "gd", "<Cmd>Lspsaga lsp_finder<CR>", bufopts)
	map("i", "<C-k>", "<Cmd>Lspsaga signature_help<CR>", bufopts)
	map("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", bufopts)
	map("n", "gr", "<Cmd>Lspsaga rename<CR>", bufopts)
	map("n", "<leader>ca", "<Cmd>Lspsaga code_action<CR>", bufopts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end

-- TypeScript
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

-- CSS
lsp.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "vscode-css-language-server", "--stdio" },
})

-- Lua
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

-- Python
lsp.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- lsp.jedi_language_server.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- })

-- lsp.pylsp.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- })
