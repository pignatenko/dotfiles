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

    vimp.noremap('<leader>ns', ':ObsidianQuickSearch<cr>')
    vimp.noremap('<leader>ng', ':ObsidianSearch<cr>')

    local obsidianAutoGroup = vim.api.nvim_create_augroup("ObsidianFiles", { clear = true });

    vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
      pattern = {"Obsidian/*.json"},
      group = obsidianAutoGroup,
      callback = function(event)
        vimp.add_buffer_maps(event.buf, function()
          vimp.inoremap('gf', ':ObsidianFollowLink<cr>')
        end)
      end
    })


  end
}

return plugin
