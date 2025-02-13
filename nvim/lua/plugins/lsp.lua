-- telescope search random things
plugin = {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
		"nvim-lua/plenary.nvim",
		require("plugins/vimp")[1],
		require("plugins/nvim-treesitter")[1],
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"quangnguyen30192/cmp-nvim-ultisnips",
		"sindrets/diffview.nvim",
		"SirVer/ultisnips",
		"nvim-lua/plenary.nvim",
		"pmizio/typescript-tools.nvim",
		{
			"creativenull/efmls-configs-nvim",
			version = "v1.x.x", -- version is optional, but recommended
			dependencies = { "neovim/nvim-lspconfig" },
		},
	},
	config = function()
		local lsp = require("lsp")
		lsp.run()
	end,
}

return plugin
