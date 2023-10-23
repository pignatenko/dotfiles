plugin = {
  'vim-test/vim-test',
  dependencies = {
    'svermeulen/vimpeccable',
  },
  config = function ()
    vim.cmd([[
      let test#strategy = 'neovim'
    ]])
    local vimp = require('vimp');
    vimp.nnoremap('<leader>tn', ':TestNearest<CR>')
    vimp.nnoremap('<leader>tf', ':TestFile<CR>')
    vimp.nnoremap('<leader>ts', ':TestSuite<CR>')
    vimp.nnoremap('<leader>tl', ':TestLast<CR>')
    vimp.nnoremap('<leader>tv', ':TestVisit<CR>')
  end

}

return plugin
