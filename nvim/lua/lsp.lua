command = {}

function command.run ()
  local global = require('lsp/global');
  global.run()
  local install = require('lsp/install');
  install.run()
  local config = require('lsp/cmp');
  config.run()
end

return command
