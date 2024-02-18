return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			autotag = { enable = true },
		})
	end,
}
