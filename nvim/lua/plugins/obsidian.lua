plugin = {
  'epwalsh/obsidian.nvim',
  requires = {
    'hrsh7th/nvim-cmp',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require("obsidian").setup({
      dir = "~/Documents/Obsidian/",
      daily_notes = {
        folder = os.date "journals/%Y/%m/",
      },
      disable_frontmatter = true,
      completion = {
        nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
      },
      use_advanced_uri = true
    })

    local vimp = require('vimp')
    vimp.noremap('<leader>ns', ':ObsidianQuickSwitch<cr>')
    vimp.noremap('<leader>ng', ':ObsidianSearch<cr>')

    local obsidianAutoGroup = vim.api.nvim_create_augroup("ObsidianFiles", { clear = true });

    vim.api.nvim_create_autocmd({"BufEnter"}, {
      pattern = {"*/Obsidian/*.md"},
      group = obsidianAutoGroup,
      once = true,
      callback = function(event)
        -- set `gf` to use ObsidianFollowLink
        vimp.add_buffer_maps(event.buf, function()
          vimp.noremap('gf', ':ObsidianFollowLink<cr>')
        end)

        -- Use tabs
        vim.bo.expandtab = false
      end
    })


  end
}

return plugin
