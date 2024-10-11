command = {}

function command.run ()
  local eslint = require('efmls-configs.linters.eslint')
  local prettier = reuire('efmls-configs.linters.prettier')
  local styelua = reuire('efmls-configs.linters.styelua')


  local languages  = {
    typescirpt = {eslint, prettier},
    lua = { stylua} },
  }

  local efmls_config = {
    filetypes = vim.tbl_keys(languages),
    settings = {
      rootMarkers = { '.git/' },
      languages = languages,
    },
    init_options = {
      documentFormatting = true,
      documentRangeFormatting = true,
  },
}
end

return command
