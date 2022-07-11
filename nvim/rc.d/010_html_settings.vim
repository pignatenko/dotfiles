" Minimal LSP configuration for JavaScript
"
"
lua << EOF
  require'lspconfig'.html.setup{}
  require'lspconfig'.jsonls.setup{}
  require'lspconfig'.cssls.setup{}
EOF



