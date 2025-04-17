return {
	tabs = function(tab_size_in_spaces)
		vim.o.expandtab = false
		vim.o.tabstop = tab_size_in_spaces
		vim.o.shiftwidth = 0 -- uses 1 tab per shift
		vim.o.softtabstop = 0
		vim.o.smarttab = true
	end,
	spaces = function(tab_size_in_spaces)
		vim.o.expandtab = true
		vim.o.tabstop = tab_size_in_spaces
		vim.o.shiftwidth = tab_size_in_spaces
		vim.o.softtabstop = -1
		vim.o.smarttab = true
	end,
}
