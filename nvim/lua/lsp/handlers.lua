local override_capabilities = require("lsp/override_capabilities")
local command = {}

function command.run()
	-- Turn off virtual text and severity signs
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = false,
		-- Disable signs
		signs = false,
	})

	-- Override dynamic capabilities
	vim.lsp.handlers["client/registerCapability"] = (function(overridden)
		return function(err, res, ctx)
			local result = overridden(err, res, ctx)
			local client = vim.lsp.get_client_by_id(ctx.client_id)
			if not client then
				return
			end
			override_capabilities(client)
			return result
		end
	end)(vim.lsp.handlers["client/registerCapability"])
end

return command
