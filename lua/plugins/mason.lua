require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "pyright" },
})
require("mason-nvim-dap").setup({
	ensure_installed = { "python" },
})
require("mason-tool-installer").setup({
	ensure_installed = {
		"stylua",
		"mypy",
		"flake8",
		"isort",
		"black",
		"luacheck",
	},
})
