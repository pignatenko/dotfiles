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
  keys = {
    {
      "<leader>fp",
      function()
        require("telescope").extensions.yank_history.yank_history({})
      end,
      mode = { "n", "x" },
      desc = "Open Yank History",
    },
    {
      "y",
      "<Plug>(YankyYank)",
      mode = { "n", "x" },
      desc = "Yank Text",
    },
    {
      "p",
      "<Plug>(YankyPutAfter)",
      mode = { "n", "x" },
      desc = "Put Text After Cursor",
    },
    {
      "P",
      "<Plug>(YankyPutBefore)",
      mode = { "n", "x" },
      desc = "Put Text Before Cursor",
    },
    {
      "gp",
      "<Plug>(YankyGPutAfter)",
      mode = { "n", "x" },
      desc = "Put Text After Selection",
    },
    {
      "gP",
      "<Plug>(YankyGPutBefore)",
      mode = { "n", "x" },
      desc = "Put Text Before Selection",
    },
    { "[y", "<Plug>(YankyCycleForward)",  desc = "Cycle Forward Through Yank History" },
    { "]y", "<Plug>(YankyCycleBackward)", desc = "Cycle Backward Through Yank History" },
    {
      "<leader>y",
      '"+y',
      mode = { "n", "v" },
      desc = "Copy to system clipboard",
    },
    {
      "<leader>Y",
      '"+y$',
      mode = { "n" },
      desc = "Copy line to system clipboard",
    },
    {
      "<leader>p",
      '"+p',
      mode = { "n", "v" },
      desc = "Paste from system clipboard",
    },
    {
      "<leader>P",
      '"+P',
      mode = { "n", "v" },
      desc = "Paste before cursor from system clipboard",
    },
  },
}
