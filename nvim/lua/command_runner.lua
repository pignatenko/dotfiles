local directory_module = require('directory_module');

command_runner = function(nvim_module_path) 
  return {
    run = function()
      local directory = directory_module(nvim_module_path);
      for _,command in ipairs(directory) do
        command.run()
      end
    end
  }
end

return command_runner
