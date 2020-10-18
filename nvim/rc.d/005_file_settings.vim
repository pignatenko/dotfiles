scriptencoding utf-8

augroup all_files
  au!
  " Put carriage returns in the gutter.
  autocmd BufWinEnter,BufEnter ?* setlocal cpoptions+=n
  " Show special characters
  autocmd BufWinEnter,BufEnter ?* setlocal list
  " Reset local PWD to env setting
  autocmd InsertLeave ?* lcd $PWD
augroup end
