plugin = {
	"vim-test/vim-test",
	init = function()
		vim.g["test#strategy"] = "neovim"
	end,
	keys = { -- Example mapping to toggle outline
		{ "<leader>tn", ":TestNearest<CR>" },
		{ "<leader>tf", ":TestFile<CR>" },
		{ "<leader>ts", ":TestSuite<CR>" },
		{ "<leader>tl", ":TestLast<CR>" },
		{ "<leader>tv", ":TestVisit<CR>" },
	},
}

return plugin
