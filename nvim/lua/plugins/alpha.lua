return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.buttons.val = {}
		dashboard.section.footer.opts.hl = "Comment"
		dashboard.section.header.opts.hl = "Comment"

		-- do not show bufferline when alpha open
		dashboard.opts.opts.setup = function()
			vim.api.nvim_create_autocmd("User", {
				pattern = "AlphaReady",
				desc = "disable tabline for alpha",
				callback = function()
					vim.opt.showtabline = 0
				end,
			})
			vim.api.nvim_create_autocmd("BufUnload", {
				buffer = 0,
				desc = "enable tabline after alpha",
				callback = function()
					vim.opt.showtabline = 2
				end,
			})
		end

		dashboard.opts.opts.noautocmd = true
		alpha.setup(dashboard.opts)

		local alpha_on_empty = vim.api.nvim_create_augroup("alpha_on_empty", { clear = true })
		vim.api.nvim_create_autocmd("User", {
			pattern = "BDeletePost*",
			group = alpha_on_empty,
			callback = function(event)
				local fallback_name = vim.api.nvim_buf_get_name(event.buf)
				local fallback_ft = vim.api.nvim_buf_get_option(event.buf, "filetype")
				local fallback_on_empty = fallback_name == "" and fallback_ft == ""

				if fallback_on_empty then
					vim.cmd("Alpha")
					vim.cmd(event.buf .. "bwipeout")
				end
			end,
		})
	end,
}
