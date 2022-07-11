command = {}

function command.run ()
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      -- Disable virtual text on signs it's hard to read
      virtual_text = false,
    }
  )

  -- Global log level
  -- vim.lsp.set_log_level("debug")
end

return command
