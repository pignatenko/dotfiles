-- nvim-tree displays a file tree
plugin = {
  'kyazdani42/nvim-tree.lua',
  requires = {
    'kyazdani42/nvim-web-devicons',
    require('plugins/vimp')[1],
    require('plugins/nvim-treesitter')[1],
  },
  config = function()
    require'nvim-tree'.setup {}
    local vimp = require('vimp')
    vimp.noremap('<leader>ff', ':NvimTreeFindFileToggle<CR>')

    -- a list of groups can be found at `:help nvim_tree_highlight`
    vim.cmd([[highlight NvimTreeFolderIcon guibg=blue]])
  end
}

return plugin
