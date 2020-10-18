" Minimal LSP configuration for JavaScript

" call DoesCommandExist('javascript-typescript-stdio')
" call DoesCommandExist('eslint')

" Set ALE linters to eslint
" let g:ale_linters.javascript = ['eslint']
" Set LanguageServer to javascript-typescript-stdio
" let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']

" augroup javascript
"   au!
"   autocmd FileType javascript setlocal cfu=LanguageClient#complete
" augroup end


