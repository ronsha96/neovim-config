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
