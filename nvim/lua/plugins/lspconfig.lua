return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
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

			-- [mason_server_name] = setup_fn
			local servers = {
				["biome"] = function()
					lspconfig["biome"].setup({ capabilities = capabilities })
				end,
				["gopls"] = function()
					lspconfig["gopls"].setup({ capabilities = capabilities })
				end,
				["rust-analyzer"] = function()
					lspconfig["rust_analyzer"].setup({ capabilities = capabilities })
				end,
				["svelte-language-server"] = function()
					lspconfig["svelte"].setup({ capabilities = capabilities })
				end,
				["pyright"] = function()
					lspconfig["pyright"].setup({ capabilities = capabilities })
				end,
				["tailwindcss-language-server"] = function()
					lspconfig["tailwindcss"].setup({
						capabilities = capabilities,
						root_dir = lspconfig.util.root_pattern(
							"tailwind.config.js",
							"tailwind.config.cjs",
							"tailwind.config.mjs",
							"tailwind.config.ts"
						),
					})
				end,
				["css-lsp"] = function()
					vim.filetype.add({ extension = { postcss = "css" } })
					lspconfig["cssls"].setup({
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
				["yaml-language-server"] = function()
					lspconfig["yamlls"].setup({
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
				["json-lsp"] = function()
					lspconfig["jsonls"].setup({
						capabilities = capabilities,
						settings = {
							json = {
								schemas = require("schemastore").json.schemas(),
								validate = { enable = true },
							},
						},
					})
				end,
				["lua-language-server"] = function()
					require("neodev").setup({})
					lspconfig["lua_ls"].setup({
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
				["typescript-language-server"] = function()
					require("typescript-tools").setup({
						capabilities = capabilities,
					})
				end,
				["typst-lsp"] = function()
					vim.filetype.add({ extension = { typ = "typst" } })
					lspconfig["typst_lsp"].setup({ capabilities = capabilities })
				end,
				["clangd"] = function()
					lspconfig["clangd"].setup({ capabilities = capabilities })
				end,
			}

			local mason_registry = require("mason-registry")
			for mason_server_name, setup_fn in pairs(servers) do
				if not mason_registry.is_installed(mason_server_name) then
					vim.cmd("MasonInstall " .. mason_server_name)
				end
				setup_fn()
			end
		end,
	},
}
