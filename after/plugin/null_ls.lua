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
		-- Javascript / Typescript
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.rome,
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.code_actions.eslint_d,

		-- Python
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.isort,
		null_ls.builtins.formatting.sqlfluff.with({
			filetypes = { "sql", "mysql", "plsql" },
			extra_args = { "--dialect", "mysql" },
		}),

		-- Lua
		null_ls.builtins.formatting.stylua,

		-- TOML
		null_ls.builtins.formatting.taplo,
	},
})
