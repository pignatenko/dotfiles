local plugin = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    sort = { "alphanum" },
  },
  keys = {
    {
      "j",
      "gj",
      mode = { "n", "v" },
      desc = "Down (wrapped)",
      remap = false,
    },
    {
      "k",
      "gk",
      mode = { "n", "v" },
      desc = "Up (wrapped)",
      remap = false,
    },
    {
      "<Down>",
      "<C-o>gj",
      mode = { "i" },
      desc = "Down (wrapped)",
      remap = false,
    },
    {
      "<Up>",
      "<C-o>gk",
      mode = { "i" },
      desc = "Up (wrapped)",
      remap = false,
    },
    {
      "<C-a>",
      "<Home>",
      mode = { "c" },
      remap = false,
      desc = "Move to beigning of line",
    },
    {
      "<C-e>",
      "<End>",
      mode = { "c" },
      remap = false,
      desc = "Move to end of line",
    },
    {
      "<M-b>",
      "<C-Left>",
      mode = { "c" },
      remap = false,
      desc = "Back one word",
    },
    {
      "<M-f>",
      "<C-Right>",
      mode = { "c" },
      remap = false,
      desc = "Forward one word",
    },
    {
      "<C-f>",
      "<Left>",
      mode = { "c" },
      remap = false,
      desc = "Back one char",
    },
    {
      "<C-b>",
      "<Right>",
      mode = { "c" },
      remap = false,
      desc = "Forward one char",
    },
    {
      "<C-X><C-F>",
      "<C-O>:lcd %:p:h<CR><C-X><C-F>",
      mode = { "i" },
      remap = false,
      desc = "File complete relative to current file",
    },
    {
      "<leader>fyn",
      ':let @+=expand("%")<CR>',
      remap = false,
      desc = "Copy name of the current file to system clipboard",
    },
  },
}

return plugin
