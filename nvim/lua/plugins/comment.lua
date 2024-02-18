return {
	"numToStr/Comment.nvim",
	keys = {
		{ "gcc", mode = "n", desc = "Comment toggle current line" },
		{ "gbc", mode = "n", desc = "Comment toggle current block" },
		{ "gco", mode = "n", desc = "Insert comment to the next line and enters INSERT mode" },
		{ "gcO", mode = "n", desc = "Insert comment to the previous line and enters INSERT mode" },
		{ "gcA", mode = "n", desc = "Insert comment to end of the current line and enters INSERT mode" },
		{ "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
		{ "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
		{ "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
		{ "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
	},
	config = function()
		local comment = require("Comment")
		comment.setup()
	end,
}
