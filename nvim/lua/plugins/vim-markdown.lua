plugin = {
  'plasticboy/vim-markdown',
  config = function()
    vim.o.foldexpr = "nvim_treesitter#foldexpr()"
  end
}

return plugin
