return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"onsails/lspkind.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		{
			"L3MON4D3/LuaSnip",
			dependencies = {
				"saadparwaiz1/cmp_luasnip",
				"rafamadriz/friendly-snippets",
			},
			version = "2.*",
			build = "make install_jsregexp",
		},
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		local luasnip = require("luasnip")
		require("luasnip.loaders.from_vscode").lazy_load()
		cmp.setup({
			window = {
				completion = cmp.config.window.bordered({
					border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
					-- border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
					scrollbar = false,
					winhighlight = "Normal:Normal,FloatBorder:CmpWinBorder,CursorLine:PmenuSel,Search:None",
				}),
				documentation = cmp.config.window.bordered({
					border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
					-- border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
					scrollbar = false,
					winhighlight = "Normal:Normal,FloatBorder:CmpWinBorder,CursorLine:PmenuSel,Search:None",
				}),
			},
			mapping = {
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.close(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Insert,
					select = true,
				}),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif require("luasnip").expand_or_jumpable() then
						vim.fn.feedkeys(
							vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
							""
						)
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif require("luasnip").jumpable(-1) then
						vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
			},
			completion = {
				completeopt = "menu,menuone",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			sources = {
				{ name = "nvim_lsp_signature_help" },
				{ name = "nvim_lsp", keyword_length = 1 },
				{ name = "nvim_lua", keyword_length = 1 },
				{ name = "luasnip", keyword_length = 2 },
				{ name = "path" },
				{ name = "buffer", keyword_length = 3 },
			},
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol",
					maxwidth = 50,
					ellipsis_char = "...",
					before = function(entry, vim_item)
						return vim_item
					end,
				}),
			},
		})
	end,
}
