-- telescope search random things
plugin = {
  "saghen/blink.cmp",
  event = "VeryLazy",
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
  keys = {
    {
      "<C-X><C-J>",
      function()
        local cmp = require("blink.cmp")
        cmp.show_and_insert({
          providers = {
            "snippets",
          },
        })
      end,
      remap = false,
      desc = "Complete snippet",
      mode = "i",
    },
    {
      "<C-X><C-O>",
      function()
        local cmp = require("blink.cmp")
        cmp.show_and_insert({
          providers = { "lsp", "path", "snippets", "buffer" },
        })
      end,
      remap = false,
      desc = "Show completion",
      mode = "i",
    },
    {
      "<C-X><C-F>",
      function()
        local cmp = require("blink.cmp")
        cmp.show_and_insert({
          providers = {
            "path",
          },
        })
      end,
      remap = false,
      desc = "Complete path",
      mode = "i",
    },
  },
}

return plugin
