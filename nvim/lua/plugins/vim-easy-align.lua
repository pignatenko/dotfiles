plugin = {
  'junegunn/vim-easy-align',
  requires = {{require('plugins/vimp')[1]}},
  config = function ()
    local vimp = require('vimp')

      -- For visual mode (e.g. vip<Enter>)
    vimp.vnoremap('<Enter>', '<Plug>(EasyAlign)')

      -- For normal mode, with Vim movement (e.g. <Leader>aip)
    vimp.nnoremap('<Leader>a', '<Plug>(EasyAlign)')
  end
}

return plugin
