return {
	settings = function(buf)
		vim.bo[buf].expandtab = true
		vim.o.cpoptions = string.format("%sn", vim.o.cpoptions)
	end,
}
