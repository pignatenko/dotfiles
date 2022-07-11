" Minimal LSP configuration for JavaScript
" call DoesCommandExist('eslint')

" Set ALE linters to eslint
" let g:ale_linters.javascript = ['eslint']
" Set LanguageServer to javascript-typescript-stdio
" let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']

" augroup javascript
"   au!
"   autocmd FileType javascript setlocal cfu=LanguageClient#complete
" augroup end
"
" " Decode URI encoded characters

" " Attempt to clear non-focused buffers with matching name
" function! ClearDuplicateBuffers(uri)
"     " if our filename has URI encoded characters
"     if DecodeURI(a:uri) !=# a:uri
"         " wipeout buffer with URI decoded name - can print error if buffer in focus
"         sil! exe "bwipeout " . fnameescape(DecodeURI(a:uri))
"         " change the name of the current buffer to the URI decoded name
"         exe "keepalt file " . fnameescape(DecodeURI(a:uri))
"         " ensure we don't have any open buffer matching non-URI decoded name
"         sil! exe "bwipeout " . fnameescape(a:uri)
"     endif
" endfunction

" function! RzipOverride()
"     " Disable vim-rzip's autocommands
"     autocmd! zip BufReadCmd   zipfile:*,zipfile:*/*
"     exe "au! zip BufReadCmd ".g:zipPlugin_ext

"     " order is important here, setup name of new buffer correctly then fallback to vim-rzip's handling
"     autocmd zip BufReadCmd   zipfile:*  call ClearDuplicateBuffers(expand("<amatch>"))
"     autocmd zip BufReadCmd   zipfile:*  call rzip#Read(DecodeURI(expand("<amatch>")), 1)

"     if has("unix")
"         autocmd zip BufReadCmd   zipfile:*/*  call ClearDuplicateBuffers(expand("<amatch>"))
"         autocmd zip BufReadCmd   zipfile:*/*  call rzip#Read(DecodeURI(expand("<amatch>")), 1)
"     endif

"     exe "au zip BufReadCmd ".g:zipPlugin_ext."  call rzip#Browse(DecodeURI(expand('<amatch>')))"
" endfunction


function! OpenZippedFile(f)
    echo "HERE"
  " get number of new (empty) buffer
  let l:b = bufnr('%')
  " construct full path
  let l:f = substitute(a:f, '%\([a-fA-F0-9][a-fA-F0-9]\)', '\=nr2char("0x" . submatch(1))', "g")
  let l:f = substitute(l:f, '.*zipfile:/', 'zipfile:///', '')
  echo  l:f

  " swap back to original buffer
  b #
  " delete new one
  exe 'bwipeout ' . l:b
  " open buffer with correct path
  sil exe 'e ' . l:f
  call zip#Read(l:f, 1);
endfunction

au BufReadCmd */zipfile:/* call OpenZippedFile(expand('<afile>'))



lua << EOF

  local lspconfig = require 'lspconfig'

  local nvim_lsp = require('lspconfig')

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      -- Disable signs
      virtual_text = false,
    }
  )

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions

    -- Use `[c` and `]c` to navigate diagnostics
    buf_set_keymap('n', ']c', '<cmd>lua vim.diagnostic.goto_prev({ float = {0, {scope="line"}} })<CR>', opts)
    buf_set_keymap('n', ']c', '<cmd>lua vim.diagnostic.goto_next({ float = {0, {scope="line"} })<CR>', opts)

    buf_set_keymap('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', '<leader>gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)

    buf_set_keymap('n', '<leader>ld', '<cmd>lua vim.diagnostic.open_float(0, {scope="line"})<CR>', opts)
    buf_set_keymap('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

    buf_set_keymap('n', '<leader>cn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

    buf_set_keymap('n', '<leader>bf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    buf_set_keymap('n', '<leader>ba', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

    --- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    if (client.name === "eslint") then
      buf_set_keymap('n', '<leader>bf', '<cmd>lua vim.lsp.buf.formatting()<CR><cmd>EslintFixAll', opts)
    end
  end

  vim.lsp.set_log_level("debug")

  lspconfig.tsserver.setup{
    on_attach = on_attach,
  }

  lspconfig.eslint.setup {
    on_attach = on_attach,
    settings = {
      nodePath = '.yarn/sdks',
      packageManager = 'yarn'
    }
  }
EOF




" xmap <leader>gq  <Plug>(coc-format-selected)
" nmap <leader>gq  <Plug>(coc-format-selected)

" nmap <leader>qf  <Plug>(coc-fix-current)

" nnoremap <silent> <leader>ld  :<C-u>CocList diagnostics<cr>
" nnoremap <silent> <leader>so :<C-u>CocList outline<cr>
" nnoremap <silent> <leader>ss :<C-u>CocList -I symbols<cr>
