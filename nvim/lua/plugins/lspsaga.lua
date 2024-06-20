return {
	"nvimdev/lspsaga.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	event = "LspAttach",
	config = function()
		local lspsaga = require("lspsaga")

		lspsaga.setup({
			lightbulb = {
				enable = false,
			},
			symbol_in_winbar = {
				enable = false,
			},
			definition = {
				edit = "<CR>",
			},
		})

		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local keymap = vim.keymap -- for conciseness
		local opts = { noremap = true, silent = true }

		keymap.set("n", "<leader>gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
		keymap.set("n", "<leader>pd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
		keymap.set("n", "<leader>gd", "<cmd>Lspsaga goto_definition<CR>", opts) -- see definition and make edits in window
		keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
		keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
		keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
		keymap.set("n", "<leader>ds", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
		keymap.set("n", "<leader>dp", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
		keymap.set("n", "<leader>dn", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
		keymap.set("n", "<leader>K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
		keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts) -- see outline on right hand side
	end,
}
