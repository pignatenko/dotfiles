-- telescope search random things
plugin = {
  'brookhong/telescope-pathogen.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'kyazdani42/nvim-web-devicons',
    require('plugins/vimp')[1],
    require('plugins/nvim-treesitter')[1],
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    local vimp = require('vimp')

    vimp.noremap('<leader>fs', ':Telescope find_files<cr>')
    vimp.noremap('<leader>fg', ':Telescope live_grep<cr>')
    vimp.noremap('<leader>fb', ':Telescope buffers<cr>')
    vimp.noremap('<leader>ft', ':Telescope tags<cr>')
    vimp.noremap('<leader>fh', ':Telescope help_tags<cr>')
    vimp.noremap('<leader>fq', ':Telescope quickfix<cr>')
    vimp.noremap('<leader>fl', ':Telescope loclist<cr>')
    vimp.noremap('<leader>fj', ':Telescope jumplist<cr>')
    vimp.noremap('<leader>fr', ':Telescope registers<cr>')
    -- vimp.noremap('<leader>fld', ':Telescope diagnostics<cr>')
    -- vimp.noremap('<leader>flr', ':Telescope lsp_references<cr>')

    require("telescope").load_extension("pathogen")
    vim.keymap.set('v', '<space>g', require("telescope").extensions["pathogen"].grep_string)

    -- TODO Treesitter
    -- TODO LSP
  end
}

return plugin
