return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {},
	config = function()
		local lsp_fallback = setmetatable({
			svelte = "always",
		}, {
			__index = function()
				return true
			end,
		})

		local conform = require("conform")
		conform.setup({
			format_on_save = function(buf)
				return {
					timeout_ms = 500,
					quiet = true,
					lsp_fallback = lsp_fallback[vim.bo[buf].filetype],
				}
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_format" },
				markdown = { "prettierd" },
				html = { "prettierd", "rustywind" },
				css = { "prettierd", "rustywind" },
				typescript = { "biome" },
				javascript = { "biome" },
				typescriptreact = { "biome", "rustywind" },
				javascriptreact = { "biome", "rustywind" },
				svelte = { "rustywind" },
				json = { "biome" },
				typst = { "typstfmt" },
			},
		})
	end,
}
