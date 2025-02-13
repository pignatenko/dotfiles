plugin = {
	"joshuadanpeterson/typewriter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	lazy = true,
	cmd = {
		"TWEnable",
		"TWDisable",
		"TWToggle",
		"TWCenter",
		"TWTop",
		"TWBottom",
	},
	config = function()
		require("typewriter").setup()
	end,
}

return plugin
