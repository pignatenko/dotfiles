plugin = {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'kyazdani42/nvim-web-devicons',
    'folke/tokyonight.nvim',
  },
  config  = function () 
    require('lualine').setup({
      options = {
          icons_enabled = true,
          theme = 'tokyonight',
          component_separators = '|',
          section_separators = { left = '', right = '' },
          disabled_filetypes = {},
          always_divide_middle = true,
        },
        sections = {
          lualine_a = {
            { 'mode', separator = { left = '' }, right_padding = 2 },
          },
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {
            {
              'filename',
              path = 1
            }
          },
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {
            { 'location', separator = { right = '' }, left_padding = 2 },
          },
        },
        inactive_sections = {
          lualine_a = {
            {
              'filename',
              path = 1
            }
          },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {'location'}
        },
        tabline = {},
        extensions = {'nvim-tree', 'quickfix', 'toggleterm', 'fugitive'}
    })
  end

}

return plugin
