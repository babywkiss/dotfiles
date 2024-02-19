return {
	"williamboman/mason.nvim",
	cmd = {
		"Mason",
		"MasonInstall",
		"MasonLog",
		"MasonUninstall",
		"MasonUninstallAll",
		"MasonUpdate",
	},
	config = function()
		require("mason").setup()
	end,
}
