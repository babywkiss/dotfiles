return {
	"famiu/bufdelete.nvim",
	keys = {
		{
			"<leader>q",
			function()
				if vim.api.nvim_buf_get_name(0) ~= "" and vim.o.buftype == "" then
					require("bufdelete").bufdelete(0)
				else
					vim.cmd("quit")
				end
			end,
		},
	},
}
