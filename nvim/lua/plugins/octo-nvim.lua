-- github plugin to review etc
plugin = {
  "pwntester/octo.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "Octo",
  config = function()
    require("octo").setup({})
  end,
}

return plugin
