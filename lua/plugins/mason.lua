require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "pyright" },
})
require("mason-null-ls").setup({
    ensure_installed = { "stylua", "black", "flake8", "pyproject-flake8", "isort" },
})
require("mason-nvim-dap").setup({
    ensure_installed = { "python" }
})
