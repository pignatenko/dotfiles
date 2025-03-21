-- Create a terminal and toggle it
plugin = {
	"akinsho/toggleterm.nvim",
	dependencies = {
		require("plugins/vimp")[1],
	},
	config = function()
		require("toggleterm").setup({})
		local vimp = require("vimp")

		vimp.nnoremap("<Leader>tt", ":ToggleTerm<cr>")

		vim.cmd([[
      augroup terminal
        au!
        au TermOpen * setlocal nonumber
        au TermOpen * setlocal norelativenumber
        au TermOpen * setlocal foldcolumn=0
        au TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>
        au TermOpen * tnoremap <buffer> <S-BS> <BS>
      augroup end
    ]])
	end,
}

return plugin
