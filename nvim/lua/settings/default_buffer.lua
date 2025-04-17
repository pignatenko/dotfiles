return {
  settings = function(buf)
    vim.bo[buf].expandtab = true
    vim.o.cpoptions = string.format("%sn", vim.o.cpoptions)
    require("which-key").add({
      {
        "<leader>fp",
        function()
          require("telescope").extensions.yank_history.yank_history({})
        end,
        mode = { "n", "x" },
        desc = "Open Yank History",
        buffer = buf,
      },
      {
        "y",
        "<Plug>(YankyYank)",
        mode = { "n", "x" },
        desc = "Yank Text",
        buffer = buf,
      },
      {
        "p",
        "<Plug>(YankyPutAfter)",
        mode = { "n", "x" },
        desc = "Put Text After Cursor",
        buffer = buf,
      },
      {
        "P",
        "<Plug>(YankyPutBefore)",
        mode = { "n", "x" },
        desc = "Put Text Before Cursor",
        buffer = buf,
      },
      {
        "gp",
        "<Plug>(YankyGPutAfter)",
        mode = { "n", "x" },
        desc = "Put Text After Selection",
        buffer = buf,
      },
      {
        "gP",
        "<Plug>(YankyGPutBefore)",
        mode = { "n", "x" },
        desc = "Put Text Before Selection",
        buffer = buf,
      },
      {
        "[y",
        "<Plug>(YankyCycleForward)",
        desc = "Cycle Forward Through Yank History",

        buffer = buf,
      },
      {
        "]y",
        "<Plug>(YankyCycleBackward)",
        desc = "Cycle Backward Through Yank History",

        buffer = buf,
      },
      {
        "<leader>y",
        '"+y',
        mode = { "n", "v" },
        desc = "Copy to system clipboard",
        buffer = buf,
      },
      {
        "<leader>Y",
        '"+y$',
        mode = { "n" },
        desc = "Copy line to system clipboard",
        buffer = buf,
      },
      {
        "<leader>p",
        '"+p',
        mode = { "n", "v" },
        desc = "Paste from system clipboard",
        buffer = buf,
      },
      {
        "<leader>P",
        '"+P',
        mode = { "n", "v" },
        desc = "Paste before cursor from system clipboard",
        buffer = buf,
      },
    })
  end,
}
