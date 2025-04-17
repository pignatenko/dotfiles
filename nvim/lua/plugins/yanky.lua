-- better yank / paste
return {
  "gbprod/yanky.nvim",
  dependencies = {
    require("plugins/telescope"),
  },
  recommended = true,
  desc = "Better Yank/Paste",
  cmd = {
    "YankyYank",
    "YankyPutAfter",
    "YankyPutBefore",
    "YankyGPutAfter",
    "YankyGPutBefore",
    "YankyCycleForward",
    "YankyCycleBackward",
  },
  opts = {
    highlight = { timer = 150 },
  },
}
