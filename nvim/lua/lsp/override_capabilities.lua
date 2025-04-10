local servers_by_name = require("lsp/servers_by_name")

local function override_capabilities(client)
  local server = servers_by_name[client.name]
  if server == nil then
    return
  end

  local overrides = server.override_capabilities

  if overrides == nil then
    return
  end

  for key, value in pairs(overrides) do
    client.server_capabilities[key] = value
  end
end

return override_capabilities
