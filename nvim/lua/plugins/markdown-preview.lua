plugin = {
  'iamcco/markdown-preview.nvim',
  config = function ()
    vim.cmd([[
      call mkdp#util#install()
    ]])
  end
}

return plugin
