directory_module = function(nvim_module_path) 
  local directory = {}
  for filePath in string.gmatch(vim.fn.globpath(vim.fn.expand("$HOME/.config/nvim/lua/".. nvim_module_path), '*.lua'), "[^%s]+") do
    local relativeFilePath = string.gsub(filePath, vim.fn.expand("$HOME/.config/nvim/lua/"), "")
    local modulePath = string.gsub(relativeFilePath, ".lua$", "")
    local module = require(modulePath)
    table.insert(directory, module);
  end
  return directory;
end

return directory_module
