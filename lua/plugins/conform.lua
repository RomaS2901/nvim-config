local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
	},
	format_on_save = {
		lsp_fallback = true,
		async = false,
		-- huge timeout to support formatting on Fold5
		timeout_ms = 5000,
	},
})
