command = {}

function command.run ()
  local lsp_installer = require "nvim-lsp-installer"

  local servers = require('lsp/servers')
  for _, server_config in ipairs(servers) do
    local server_name = server_config[1];

    local is_found, lsp_server = lsp_installer.get_server(server_name)
      if is_found and not lsp_server:is_installed() then
        print("Installing LSP...  " .. server_name)
        lsp_server:install()
    end
  end
end

return command
