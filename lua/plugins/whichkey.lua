local wk = require("which-key")
local M = {}

M.init = function()
	vim.o.timeout = true
	vim.o.timeoutlen = 300
end

M.opts = {
	-- Your which-key configuration settings can go here
	-- You can add keybindings, plugin-specific settings, etc.
}

M.init()
wk.setup(M.opts)
wk.register({
	["<leader>"] = {
		e = { "Neotree float" },
		o = { "Neotree git status" },
		w = { "Save" },
		h = { "Search" },
		l = {
			name = "LSP",
			D = "Diagnostic float",
			["[d"] = "Diagnostic goto prev",
			["]d"] = "Diagnostic goto next",
			q = "Set loc list",
			g = {
				name = "Goto",
				D = "Declarations",
				d = "Definitions",
				i = "Implementations",
				r = "References",
			},
			K = "Hover",
			k = "Signature help",
			w = {
				name = "Workspace",
				a = "Add worspace folder",
				r = "Remove workspace folder",
				l = "List workspace folders",
			},
			d = "Type definitions",
			r = "Buf rename",
			a = "Code actions",
			f = "Format",
		},
		f = {
			name = "Telescope",
			f = "Files",
			w = "Live grep",
			b = "Buffers",
			t = "Todos",
			h = "Help tags",
			g = {
				name = "Git",
				b = "Branches",
				c = "Commits",
				s = "Status",
			},
			l = {
				name = "LSP",
				s = "Document symbol",
				r = "References",
				d = "Definitions",
			},
		},
		b = {
			name = "Buffer",
			n = "Next",
			p = "Previous",
			x = "Pick to close",
			X = "Close right",
		},
		t = {
			name = "ToggleTerm",
			f = "Float",
			h = "Horizontal",
			v = "Vertical",
		},
		P = {
			name = "Python",
			e = {
				name = "Dotenv",
				l = "Load",
				p = "Load from path",
				i = "Inspect",
			},
			v = {
				name = "Venv",
				s = "Select",
				c = "Select cached",
				i = "Select current",
			},
		},
		x = {
			name = "Trouble",
			x = "Toggle",
			w = "Workspace diagnostics",
			d = "Document diagnostics",
			q = "Quickfix",
			l = "Loclist",
			g = {
				name = "Goto",
				R = "LSP references",
			},
		},
		d = {
			name = "DAP",
			m = "Test method",
			M = "Test method DAP",
			f = "Test class",
			F = "Test class DAP",
			S = "Test summary",
		},
		["["] = {
			name = "Goto prev",
			d = "Diagnostic goto prev",
			b = "Buffer goto prev",
		},
		["]"] = {
			name = "Goto next",
			d = "Diagnostic goto next",
			b = "Buffer goto next",
		},
	},
})
