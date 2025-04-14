-- telescope search random things
return {
	"brookhong/telescope-pathogen.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"kyazdani42/nvim-web-devicons",
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local actions = require("telescope.actions")
		require("telescope").setup({
			pickers = {
				lsp_dynamic_workspace_symbols = {
					mappings = {
						i = {
							["<C-R>"] = actions.to_fuzzy_refine,
						},
					},
				},
				live_grep = {
					mappings = {
						i = {
							["<C-R>"] = actions.to_fuzzy_refine,
						},
					},
				},
			},
		})
	end,
	keys = {
		{ "<leader>fs", ":Telescope find_files<cr>", remap = false },
		{ "<leader>fg", ":Telescope live_grep<cr>", remap = false },
		{ "<leader>fb", ":Telescope buffers<cr>", remap = false },
		{ "<leader>ft", ":Telescope tags<cr>", remap = false },
		{ "<leader>fh", ":Telescope help_tags<cr>", remap = false },
		{ "<leader>fq", ":Telescope quickfix<cr>", remap = false },
		{ "<leader>fl", ":Telescope loclist<cr>", remap = false },
		{ "<leader>fj", ":Telescope jumplist<cr>", remap = false },
		{ "<leader>fr", ":Telescope registers<cr>", remap = false },
	},
}
