function! RemapTerminalEscape()
  if @% =~ '#FZF'
    return
  endif
  tnoremap <buffer> <Esc> <C-\><C-n>
endfunction

augroup terminal
  au!
  au TermOpen * setlocal nonumber
  au TermOpen * setlocal norelativenumber
  au TermOpen * setlocal foldcolumn=0
  au TermOpen * call RemapTerminalEscape()
augroup end
