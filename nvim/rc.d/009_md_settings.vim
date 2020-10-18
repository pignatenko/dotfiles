" Minimal LSP configuration for JavaScript

augroup markdown
  au!
  autocmd FileType markdown silent exec "!sh ~/.config/nvim/scripts/ensure_plant_uml_server.sh"
augroup end


