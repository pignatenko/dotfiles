-- better yank / paste
return {
  "gbprod/yanky.nvim",
  event = "VeryLazy",
  dependencies = {
    require("plugins/telescope"),
  },
  desc = "Better Yank/Paste",
  opts = {
    highlight = { timer = 150 },
  },
}
