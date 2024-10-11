command = {}

function command.run()
	local on_attach = require("lsp/on_attach")

	local diagnostic_config = {
		diagnostic_config = {
			virtual_text = false,
		},
	}

	local eslint = require("efmls-configs.linters.eslint")
	local prettier = require("efmls-configs.formatters.prettier")
	local stylua = require("efmls-configs.formatters.stylua")

	local languages = {
		typescriptreact = { eslint, prettier },
		javascript = { eslint, prettier },
		typescript = { eslint, prettier },
		lua = { stylua },
	}

	local efmls_config = {
		filetypes = vim.tbl_keys(languages),
		settings = {
			rootMarkers = { ".git/" },
			languages = languages,
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
		},
	}

	require("mason").setup()
	require("mason-lspconfig").setup({
		ensure_installed = { "tsserver" },
	})
	require("mason-lspconfig").setup_handlers({
		-- The first entry (without a key) will be the default handler
		-- and will be called for each installed server that doesn't have
		-- a dedicated handler.
		function(server_name) -- default handler (optional)
			require("lspconfig")[server_name].setup({
				on_attach = on_attach,
			})
		end,
		-- Next, you can provide targeted overrides for specific servers.
		-- For example, a handler override for the `rust_analyzer`:
		["tsserver"] = function()
			require("typescript").setup({
				server = {
					on_attach = on_attach,
					settings = {
						javascript = {
							autoClosingTags = false,
							preferences = {
								importModuleSpecifier = "relative",
							},
						},
						typescript = {
							preferences = {
								importModuleSpecifier = "relative",
							},
						},
					},
				},
			})
		end,
		["efm"] = function()
			require("lspconfig").efm.setup(vim.tbl_extend("force", efmls_config, {
				on_attach = on_attach,
			}))
		end,
	})
end

return command
