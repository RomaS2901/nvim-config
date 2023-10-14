require("neotest").setup({
	adapters = {
		require("neotest-python")({
			dap = { justMyCode = false },
			args = { "--log-level", "DEBUG", "-vv" },
			runner = "pytest",
		}),
	},
})
