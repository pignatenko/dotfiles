local server = {
	name = "efm",
	override_capabilities = {},
	install = true,
	setup = function(overrides)
		local eslint = require("efmls-configs.linters.eslint")
		local prettier = require("efmls-configs.formatters.prettier")
		local stylua = require("efmls-configs.formatters.stylua")
		local languages = {
			typescriptreact = { eslint, prettier },
			javascriptreact = { eslint, prettier },
			typescript = { eslint, prettier },
			javascript = { eslint, prettier },
			lua = { stylua },
		}

		local config = {
			filetypes = vim.tbl_keys(languages),
			settings = {
				languages = languages,
				rootMarkers = { ".git/" },
			},
			init_options = {
				documentFormatting = true,
				documentRangeFormatting = true,
				documentPublishDiagnostics = true,
			},
		}
		require("lspconfig").efm.setup(vim.tbl_extend("force", config, overrides))
	end,
}

return server
