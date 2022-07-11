command = {}

function command.run ()
  local install = require('lsp/install');
  install.run()
  local global = require('lsp/global');
  global.run()
  local config = require('lsp/config');
  config.run()
  local config = require('lsp/cmp');
  config.run()
end

return command
