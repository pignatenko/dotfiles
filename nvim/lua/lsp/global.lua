command = {}

function command.run ()
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        -- Disable signs
        signs = false,
      }
    )

  -- Global log level
  -- vim.lsp.set_log_level("debug")
end

return command
