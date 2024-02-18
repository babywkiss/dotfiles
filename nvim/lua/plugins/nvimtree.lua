return {
	"nvim-tree/nvim-tree.lua",
	cmd = { "NvimTreeToggle", "NvimTreeFocus" },
	keys = {
		{
			"<leader>tr",
			function()
				require("nvim-tree.api").tree.toggle({ find_file = true, focus = true })
			end,
		},
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local nvim_tree = require("nvim-tree")

		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvim_tree.setup({
			on_attach = function(bufnr)
				require("nvim-tree.api").config.mappings.default_on_attach(bufnr)
				vim.keymap.set("n", "L", "<C-w>l", { buffer = bufnr }) -- move to right window
			end,
			renderer = {
				root_folder_label = false,
			},
		})
	end,
}
