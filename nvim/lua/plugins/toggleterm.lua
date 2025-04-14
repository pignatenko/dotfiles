return {
  "akinsho/toggleterm.nvim",
  cmd = "ToggleTerm",
  config = function()
    require("toggleterm").setup({})
    local augroup = vim.api.nvim_create_augroup("Toggle Terminal Commands", {})
    vim.api.nvim_clear_autocmds({ group = augroup })
    vim.api.nvim_create_autocmd("TermOpen", {
      group = augroup,
      pattern = { "*" },
      callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.foldcolumn = "0"
        vim.opt_local.spell = false
        vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { buffer = true, remap = false })
      end,
    })
  end,
  keys = {
    { "<leader>tt", "<cmd>ToggleTerm<CR>" },
  },
}
