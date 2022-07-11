scriptencoding utf-8

" This pisses me off so much D is d$ C is c$ A is $a but Y is yy. WHY?
map Y y$
noremap Y y$

" jk should navigate wrapped text correctly
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" insert mode up and down arrows should navigate wrapped text correctly
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" Missing readline nav on command
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <M-b> <C-Left>
cnoremap <M-f> <C-Right>

" Add folds to gutter?
" Toggle gutter

function! GutterToggle()
  set invnumber invrelativenumber
  if &foldcolumn
      set foldcolumn=0
  else
      set foldcolumn=4
  endif
endfunction

nnoremap <Leader>vgt :call GutterToggle()<cr>

" Only absolute
nnoremap <Leader>vgn :set number invrelativenumber<cr>

" Default
nnoremap <Leader>vgr :set number relativenumber foldcolumn=2<cr>


" file completion relative to editing file rather than cwd of vim
inoremap <C-X><C-F> <C-O>:lcd %:p:h<CR><C-X><C-F>

" " Toggle between test and implementation file
" nnoremap <leader>`t
" nnoremap <leader>'t


" " Copy file name to global clip
nnoremap <leader>fyn :silent !echo "%:p" \| pbcopy<cr>

" " Copy file contents to global clip
nnoremap <leader>fya gg"+yG

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+y$
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P


function! SetMainTerminal()
  f MainTerminal
  set hidden
endfunction




function! OpenMainTerminal()
  if bufexists("MainTerminal") > 0
    below sp +resize\ 24 MainTerminal
  else
    below sp +f\ MainTerminal\ \|\ set\ hidden\ \|\ resize\ 24 term://zsh
  endif
endfunction

function! ToggleTerminal()
  let term_window = bufwinnr('MainTerminal')
  if term_window > 0
    exec term_window . 'wincmd c'
  else
    exec OpenMainTerminal()
  endif
endfunction

" nnoremap <Leader>tt :call ToggleTerminal()<cr>
nnoremap [q :cprev<cr>
nnoremap ]q :cnext<cr>


function! DiffMerge() range
  echom a:firstline.'-'.a:lastline
  execute a:firstline.','.a:lastline . ' g/^<\{7}\|^|\{7}\|^=\{7}\|^>\{7}/d'
endfunction

command! -range=% Gdeletemarkers <line1>,<line2>call DiffMerge()



" If buftype = terminal && bufhidden= map this
" tnoremap <Esc> <C-\><C-n>
