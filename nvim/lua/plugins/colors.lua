colors = {
  "folke/tokyonight.nvim",
  config = function()
    if vim.fn.has("termguicolors") then
      vim.o.termguicolors = true
    end

    require("tokyonight").setup({
      styles = {
        comments = { italic = false },
      },
      on_highlights = function(hl, c)
        hl.SpellBad = { fg = c.error, strikethrough = true }
        hl.SpellCap = { fg = c.warning, strikethrough = true }
        hl.SpellLocal = { fg = c.info, strikethrough = true }
        hl.SpellRare = { fg = c.hint, strikethrough = true }
      end,
    })

    vim.cmd("colorscheme tokyonight")
  end,
}

return colors
