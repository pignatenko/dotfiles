-- telescope search random things
plugin = {
  "saghen/blink.cmp",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
    "pmizio/typescript-tools.nvim",
    {
      "creativenull/efmls-configs-nvim",
      version = "v1.x.x", -- version is optional, but recommended
    },
  },
  version = "1.*",
  config = function()
    local lsp = require("lsp")
    lsp.run()
  end,
}

return plugin
