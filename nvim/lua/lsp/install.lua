command = {}

function command.run ()
  local on_attach = require('lsp/on_attach')

  local null_ls = require("null-ls")

  local sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.diagnostics.eslint_d
  }


  null_ls.setup({
    default_timeout = 10000,
    sources = sources,
    debug = true
  })
  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = { 'tsserver' }
  })
  require("mason-lspconfig").setup_handlers {
      -- The first entry (without a key) will be the default handler
      -- and will be called for each installed server that doesn't have
      -- a dedicated handler.
      function (server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup {
          on_attach = on_attach,
          }
      end,
      -- Next, you can provide targeted overrides for specific servers.
      -- For example, a handler override for the `rust_analyzer`:
      -- ["rust_analyzer"] = function ()
      --     require("rust-tools").setup {}
      -- end
  }
end

return command
