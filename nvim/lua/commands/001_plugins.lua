command = {}

function command.run ()
  local plugins = require('plugins');
  plugins.sync();
end

return command
