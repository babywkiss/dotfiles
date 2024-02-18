return {
	"akinsho/bufferline.nvim",
	-- event = "VeryLazy",
	event = { "BufReadPost", "BufNewFile" },
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local bufferline = require("bufferline")
		local p = require("rose-pine.palette")
		bufferline.setup({
			-- TODO: Fix background highlights for diagnostics
			highlights = {
				-- plain
				fill = {
					fg = p.muted,
					bg = p.base,
				},
				background = {
					fg = p.muted,
					bg = p.base,
				},
				close_button = {
					fg = p.muted,
					bg = p.base,
				},
				offset_separator = {
					bg = "#161420",
				},
				-- selected
				buffer_selected = {
					fg = p.text,
					bg = p.surface,
					bold = true,
					italic = true,
				},
				close_button_selected = {
					fg = p.subtle,
					bg = p.surface,
				},
				indicator_selected = {
					fg = p.muted,
					bg = p.surface,
				},
				tab_selected = {
					fg = p.text,
					bg = p.overlay,
				},
				-- visible
				buffer_visible = {
					fg = p.subtle,
					bg = p.base,
					bold = true,
					italic = true,
				},
				close_button_visible = {
					fg = p.muted,
					bg = p.base,
				},
				indicator_visible = {
					fg = p.subtle,
					bg = p.base,
				},
			},
			options = {
				separator_style = { "", "" },
				indicator = {
					icon = " ",
					style = "icon",
				},
				diagnostics = "nvim_lsp",
				offsets = {
					{
						separator = " ",
						highlight = "NvimTreeNormal",
						filetype = "NvimTree",
						text = "",
						text_align = "center",
					},
				},
			},
		})
	end,
}
