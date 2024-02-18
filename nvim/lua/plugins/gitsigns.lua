return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local gitsigns = require("gitsigns")
		gitsigns.setup()
	end,
}
