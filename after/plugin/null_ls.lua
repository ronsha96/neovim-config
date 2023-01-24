local null_ls = require("null-ls")

local function eslint_condition(utils)
	return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.yaml", ".eslintc.yml", ".eslintrc.json" })
end

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
		null_ls.builtins.formatting.prettierd.with({
			condition = function(utils)
				return not utils.root_has_file({ "rome.json" })
			end,
		}),
		-- null_ls.builtins.formatting.rome.with({
		-- 	condition = function(utils)
		-- 		return utils.root_has_file({ "rome.json" })
		-- 	end,
		-- }),
		null_ls.builtins.diagnostics.eslint_d.with({
			condition = eslint_condition,
		}),
		null_ls.builtins.code_actions.eslint_d.with({
			condition = eslint_condition,
		}),

		-- Python
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.isort,

		-- Sql
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
