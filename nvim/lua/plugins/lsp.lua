-- telescope search random things
plugin = {
  'hrsh7th/nvim-cmp',
  requires = {
    'neovim/nvim-lspconfig',
    'nvim-lua/plenary.nvim',
    require('plugins/vimp')[1],
    require('plugins/nvim-treesitter')[1],
    'williamboman/nvim-lsp-installer',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'quangnguyen30192/cmp-nvim-ultisnips',
    'SirVer/ultisnips',
    'jose-elias-alvarez/nvim-lsp-ts-utils'
  },
  config = function()
    local lsp = require('lsp')
    lsp.run()
  end
}

return plugin
