return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	cmd = "Telescope",
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				prompt_prefix = "   ",
				selection_caret = "  ",
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
						results_width = 0.8,
					},
					vertical = {
						mirror = false,
					},
					width = 0.87,
					height = 0.80,
				},

				mappings = {
					n = {
						["<Tab>"] = actions.move_selection_next,
						["<S-Tab>"] = actions.move_selection_previous,
					},
					i = {
						["<Tab>"] = actions.move_selection_next,
						["<S-Tab>"] = actions.move_selection_previous,
					},
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		})
		telescope.load_extension("ui-select")
		telescope.load_extension("fzf")
	end,
}
