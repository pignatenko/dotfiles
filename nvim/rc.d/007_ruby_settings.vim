" Minimal LSP configuration for JavaScript

" call DoesCommandExist('solargraph')
" call DoesCommandExist('rubocop')
" call DoesCommandExist('ruby')

" Set ALE linters to rubocop and ruby
" let g:ale_linters.ruby = ['rubocop', 'ruby']
" Set LanguageServer to solargraph
" let g:LanguageClient_serverCommands.ruby = ['solargraph', 'stdio']

augroup ruby
  au!
  autocmd FileType ruby setlocal expandtab
  autocmd FileType ruby setlocal autoindent
  autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2
augroup end


