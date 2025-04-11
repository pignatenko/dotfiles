-- nvim-tree displays a file tree
plugin = {
	"kyazdani42/nvim-tree.lua",
	dependencies = {
		"kyazdani42/nvim-web-devicons",
		require("plugins/nvim-treesitter")[1],
	},
	tag = "nightly",
	config = function()
		require("nvim-tree").setup({
			renderer = {
				icons = {
					show = {
						folder_arrow = true,
						file = true,
						folder = true,
						git = true,
					},
				},
			},
		})

		-- a list of groups can be found at `:help nvim_tree_highlight`
		vim.cmd([[highlight NvimTreeFolderIcon guibg=blue]])
	end,
	keys = {
		{ "<leader>ff", ":NvimTreeFindFileToggle<CR>", remap = false, desc = "Toggle nvim-tree" },
	},
}

return plugin
