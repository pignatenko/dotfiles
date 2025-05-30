plugin = {
  "epwalsh/obsidian.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  init = function()
    local obsidianAutoGroup = vim.api.nvim_create_augroup("ObsidianFiles", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter" }, {
      pattern = { "*/Obsidian/*.md" },
      group = obsidianAutoGroup,
      once = true,
      callback = function()
        vim.keymap.set("n", "gf", ":ObsidianFollowLink<cr>", { remap = false, buffer = true, silent = true })
        vim.keymap.set(
          "n",
          "<leader>fs",
          ":ObsidianQuickSwitch<cr>",
          { remap = false, buffer = true, silent = true }
        )
        vim.keymap.set(
          "n",
          "<leader>fg",
          ":ObsidianSearch<cr>",
          { remap = false, buffer = true, silent = true }
        )

        -- Use tabs
        vim.bo.expandtab = false
      end,
    })
  end,
  cmd = { "ObsidianToday", "ObsidianSearch", "ObsidianQuickSwitch" },
  config = function()
    require("obsidian").setup({
      dir = "~/Documents/Obsidian/",
      daily_notes = {
        folder = os.date("journals/%Y/%m/"),
      },
      disable_frontmatter = true,
      completion = {
        nvim_cmp = false, -- if using nvim-cmp, otherwise set to false
      },
      use_advanced_uri = true,
      ui = { enable = false },
    })
  end,
}

return plugin
