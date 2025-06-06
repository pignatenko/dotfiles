local command = {}

local function get_env_log_level()
	local logLevelEnv = os.getenv("NVIM_LSP_LOG_LEVEL")
	if logLevelEnv == "OFF" or logLevelEnv == "off" then
		return "OFF"
	end

	if logLevelEnv == "ERROR" or logLevelEnv == "error" then
		return "ERROR"
	end

	if logLevelEnv == "WARN" or logLevelEnv == "warn" then
		return "WARN"
	end

	if logLevelEnv == "INFO" or logLevelEnv == "info" then
		return "INFO"
	end

	if logLevelEnv == "DEBUG" or logLevelEnv == "debug" then
		return "DEBUG"
	end

	if logLevelEnv == "TRACE" or logLevelEnv == "trace" then
		return "TRACE"
	end

	return "WARN"
end

function command.run()
	vim.lsp.set_log_level(get_env_log_level())

	local servers = require("lsp/servers")
	local server_names = {}
	for _, server in ipairs(servers) do
		table.insert(server_names, server.name)
	end
	require("mason").setup()
	require("mason-lspconfig").setup({
		ensure_installed = server_names,
	})

  local on_attach = require("lsp/on_attach")
  local overrides = {
    on_attach = on_attach,
  }

  for _, server in ipairs(servers) do
    if server.name ~= nil and server.setup ~= nil then
      server.setup(overrides)
    elseif server.name == nil then
      vim.print("Detected badly formatted or unknown server")
    end
  end

end

return command
