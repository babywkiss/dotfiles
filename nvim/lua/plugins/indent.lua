return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPost", "BufNewFile" },
	main = "ibl",
	opts = {},
	config = function()
		require("ibl").setup({
			scope = {
				enabled = false,
			},
			indent = {
				char = "│",
			},
		})
	end,
}
