colors = {
  'folke/tokyonight.nvim',
  config = function ()
    if vim.fn.has("termguicolors") then
      vim.o.termguicolors = true
    end

    require("tokyonight").setup({
      styles = {
        comments = { italic = false },
      }
    })

    vim.cmd('colorscheme tokyonight')
  end,
}

return colors
