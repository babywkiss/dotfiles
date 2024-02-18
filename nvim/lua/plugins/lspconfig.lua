return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"pmizio/typescript-tools.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"folke/neodev.nvim",
			"b0o/schemastore.nvim",
		},
		config = function()
			-- Tweak UI
			vim.diagnostic.config({
				virtual_text = {
					prefix = "▎", -- Could be '●', '▎', 'x'
				},
			})
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			local servers = {
				"biome",
				"gopls",
				"rust_analyzer",
				"svelte",
				"pyright",
				-- "tailwindcss",
				function()
					lspconfig.tailwindcss.setup({
						root_dir = lspconfig.util.root_pattern(
							"tailwind.config.js",
							"tailwind.config.cjs",
							"tailwind.config.mjs",
							"tailwind.config.ts"
						),
					})
				end,
				function()
					vim.filetype.add({ extension = { postcss = "css" } })
					lspconfig.cssls.setup({
						capabilities = capabilities,
						settings = {
							css = {
								lint = {
									unknownAtRules = "ignore",
								},
							},
						},
					})
				end,
				function()
					lspconfig.yamlls.setup({
						capabilities = capabilities,
						settings = {
							yaml = {
								schemaStore = {
									enable = false,
									url = "",
								},
								schemas = require("schemastore").yaml.schemas(),
							},
						},
					})
				end,
				function()
					lspconfig.jsonls.setup({
						capabilities = capabilities,
						settings = {
							json = {
								schemas = require("schemastore").json.schemas(),
								validate = { enable = true },
							},
						},
					})
				end,
				function()
					require("neodev").setup({})
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								workspace = {
									checkThirdParty = false,
								},
								completion = {
									callSnippet = "Replace",
								},
							},
						},
					})
				end,
				function()
					require("typescript-tools").setup({
						capabilities = capabilities,
					})
				end,
			}

			for _, server in ipairs(servers) do
				-- Default handler
				if type(server) == "function" then
					server()
				else
					lspconfig[server].setup({
						capabilities = capabilities,
					})
				end
			end
		end,
	},
}
