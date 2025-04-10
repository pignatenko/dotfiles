local servers = require("lsp/servers")

local servers_by_name = {}
for _, server in ipairs(servers) do
	servers_by_name[server.name] = server
	if server.alias ~= nil then
		servers_by_name[server.alias] = server
	end
end

return servers_by_name
