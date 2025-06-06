local servers = require("lsp/servers")
local on_attach = require("lsp/on_attach")
local overrides = {
	on_attach = on_attach,
}

local setup_handlers = {
	function(server_name)
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end,
}

for _, server in ipairs(servers) do
	if server.name ~= nil and server.setup ~= nil then
		setup_handlers[server.name] = function()
			server.setup(overrides)
		end
	elseif server.name == nil then
		vim.print("Detected badly formatted or unknown server")
	end
end

return setup_handlers

