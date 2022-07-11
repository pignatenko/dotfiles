command = {}

function command.run ()
  local lsp_installer = require('nvim-lsp-installer')
  local on_attach = require('lsp/on_attach')

  local server_config_map = {};
  local servers = require('lsp/servers')
  for _, server_config in ipairs(servers) do
    local server_name = server_config[1];

    server_config_map[server_name] = server_config;
  end

  lsp_installer.on_server_ready(function(server)
    local server_config = server_config_map[server.name] or { opts = {}}
    server_config.opts.on_attach = on_attach

    server:setup(server_config.opts)
end)

end

return command
