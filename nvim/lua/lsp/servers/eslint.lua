lspserver = {
  'eslint',
  opts = {
    cmd = { "npx", "--package", "vscode-langservers-extracted", "vscode-eslint-language-server", "--stdio" },
    settings = {
      -- nodePath = '.yarn/sdks/',
      -- packageManager =  'yarn',
      -- workspaceFolder = {
      --   uri: vim.fn.getcwd(), --vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
      -- }
    }
  }
}

return lspserver
