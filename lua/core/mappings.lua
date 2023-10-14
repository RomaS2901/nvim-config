vim.g.mapleader = " "

-- NeoTree
vim.keymap.set("n", "<leader>e", ":Neotree float focus<CR>")
vim.keymap.set("n", "<leader>o", ":Neotree float git_status<CR>")

-- LSP
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<leader>lD", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>l[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>l]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>lq", vim.diagnostic.setloclist)
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "<leader>lgD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "<leader>lgd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "<leader>lgr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>lgi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<leader>lK", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>lk", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<leader>lwa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<leader>lwr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<leader>lwl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<leader>ld", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>lf", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})

-- Telescope
local telescope_builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files, {})
vim.keymap.set("n", "<leader>fw", telescope_builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers, {})
vim.keymap.set("n", "<leader>ft", ":TodoTelescope<CR>", {})
vim.keymap.set("n", "<leader>fh", telescope_builtin.help_tags, {})
vim.keymap.set("n", "<leader>fgb", telescope_builtin.git_branches, {})
vim.keymap.set("n", "<leader>fgc", telescope_builtin.git_commits, {})
vim.keymap.set("n", "<leader>fgs", telescope_builtin.git_status, {})
vim.keymap.set("n", "<leader>fls", telescope_builtin.lsp_document_symbols, {})
vim.keymap.set("n", "<leader>flr", telescope_builtin.lsp_references, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fld", telescope_builtin.lsp_definitions, { noremap = true, silent = true })

-- Bufferline
vim.keymap.set("n", "]b", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "[b", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<leader>bn", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<leader>bp", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<leader>bx", ":BufferLinePickClose<CR>")
vim.keymap.set("n", "<leader>bX", ":BufferLineCloseRight<CR>")
vim.keymap.set("n", "<leader>bs", ":BufferLineSortByTabs<CR>")
vim.keymap.set("n", "<leader>bC", ":BufferLineCloseOthers<CR>")
vim.keymap.set("n", "<leader>bc", ":Bdelete<CR>")

-- Splits
vim.keymap.set("n", "|", ":vsplit<CR>")
vim.keymap.set("n", "\\", ":split<CR>")

-- Comment
vim.keymap.set("n", "<leader>/", ":CommentToggle<CR>")

-- Navigation
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- Terminal
vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<CR>")
vim.keymap.set("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>")
vim.keymap.set("n", "<leader>tv", ":ToggleTerm direction=vertical size=40<CR>")

-- DotEnv
vim.keymap.set("n", "<leader>Pel", ":Dotenv<CR>")
vim.keymap.set(
	"n",
	"<leader>Pep",
	":call inputsave() | let custom_path = input('Enter custom .env path: ') | execute ':Dotenv ' . custom_path | call inputrestore()<cr>"
)
vim.keymap.set(
	"n",
	"<leader>Pei",
	":call inputsave() | let env_name = input('Enter env var name: ') | execute ':DotenvGet ' . env_name | call inputrestore()<cr>"
)

-- Venv selector
vim.keymap.set("n", "<leader>Pvs", ":VenvSelect<CR>")
vim.keymap.set("n", "<leader>Pvc", ":VenvSelectCached<CR>")
vim.keymap.set("n", "<leader>Pvi", ":VenvSelectCurrent<CR>")

-- Trouble
vim.keymap.set("n", "<leader>xx", function()
	require("trouble").toggle()
end)
vim.keymap.set("n", "<leader>xw", function()
	require("trouble").toggle("workspace_diagnostics")
end)
vim.keymap.set("n", "<leader>xd", function()
	require("trouble").toggle("document_diagnostics")
end)
vim.keymap.set("n", "<leader>xq", function()
	require("trouble").toggle("quickfix")
end)
vim.keymap.set("n", "<leader>xl", function()
	require("trouble").toggle("loclist")
end)
vim.keymap.set("n", "<leader>xgR", function()
	require("trouble").toggle("lsp_references")
end)

-- DAP
vim.keymap.set("n", "<leader>dm", "<cmd>lua require('neotest').run.run()<CR>")
vim.keymap.set("n", "<leader>dM", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>")
vim.keymap.set("n", "<leader>df", "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<CR>")
vim.keymap.set("n", "<leader>dF", "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<CR>")
vim.keymap.set("n", "<leader>dS", "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<CR>")

-- Git
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>")

-- Other
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
