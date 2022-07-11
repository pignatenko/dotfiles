local command_runner = require('command_runner');

return command_runner('commands');
-- commands = {};

-- function commands.run ()
--   print("start commands");
--   for filePath in string.gmatch(vim.fn.globpath(vim.fn.expand("$HOME/.config/nvim/lua/commands"), '*.lua'), "[^%s]+") do
--     print(filePath);
--     local relativeFilePath = string.gsub(filePath, "^.*/lua/", "")
--     print(relativeFilePath);
--     local modulePath = string.gsub(relativeFilePath, ".lua$", "")
--     print(modulePath);
--     local command = require(modulePath)
--     command.run()
--   end
-- end

-- return commands
