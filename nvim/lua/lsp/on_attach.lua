local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions

	-- Use `[d` and `]d` to navigate diagnostics
	vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

	buf_set_keymap("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)

	buf_set_keymap("n", "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

	buf_set_keymap("n", "<leader>cn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

	buf_set_keymap("n", "<leader>bf", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
	buf_set_keymap("n", "<leader>ba", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

	if client.name == "ts_ls" then
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end

	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ bufnr = bufnr, async = false })
			end,
		})
	end
end

return on_attach
