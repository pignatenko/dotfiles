plugin = {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		{ "nvim-tree/nvim-web-devicons", opt = true },
	},
	config = function()
		require("render-markdown").setup({})
	end,
}

return plugin
