return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    log_level = "TRACE",
    adapters = {
      ["deepseek"] = function()
        return require("codecompanion.adapters").extend("ollama", {
          name = "deepseek",
          schema = {
            model = {
              default = "deepseek-r1:8b",
            },
          },
        })
      end,
    },
    strategies = {
      chat = {
        adapter = "deepseek",
      },
      inline = {
        adapter = "deepseek",
      },
      cmd = {
        adapter = "deepseek",
      },
    },
  },
}
