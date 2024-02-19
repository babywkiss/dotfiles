return {
	"stevearc/conform.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
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

		-- TODO: link conform's formatters setup with mason packages installation
		local mason_registry = require("mason-registry")
		local mason_packages_names = { "stylua", "ruff", "prettierd", "rustywind", "biome" }
		for _, package_name in ipairs(mason_packages_names) do
			if not mason_registry.is_installed(package_name) then
				vim.cmd("MasonInstall " .. package_name)
			end
		end

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
			},
		})
	end,
}
