-- telescope search random things
plugin = {
	"brookhong/telescope-pathogen.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"kyazdani42/nvim-web-devicons",
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope.nvim",
	},
	lazy = false,
	config = function()
		local vimp = require("vimp")

		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<leader>fs", ":Telescope find_files<cr>", opts)
		vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
		vim.keymap.set("n", "<leader>fb", ":Telescope buffers<cr>", opts)
		vim.keymap.set("n", "<leader>ft", ":Telescope tags<cr>", opts)
		vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<cr>", opts)
		vim.keymap.set("n", "<leader>fq", ":Telescope quickfix<cr>", opts)
		vim.keymap.set("n", "<leader>fl", ":Telescope loclist<cr>", opts)
		vim.keymap.set("n", "<leader>fj", ":Telescope jumplist<cr>", opt)
		vim.keymap.set("n", "<leader>fr", ":Telescope registers<cr>", opts)

		require("telescope").load_extension("pathogen")
		vim.keymap.set("v", "<space>g", require("telescope").extensions["pathogen"].grep_string)

		local actions = require("telescope.actions")
		require("telescope").setup({
			pickers = {
				live_grep = {
					mappings = {
						i = {
							["<C-R>"] = actions.to_fuzzy_refine,
						},
					},
				},
			},
		})

		-- TODO Treesitter
		-- TODO LSP
	end,
}

return plugin
