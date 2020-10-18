scriptencoding utf-8

call plug#begin('~/.config/nvim/plugged')

"Color schemes
Plug 'Rigellute/shades-of-purple.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'joshdick/onedark.vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'wadackel/vim-dogrun'

" Pretty Status
Plug 'itchyny/lightline.vim'

let g:lightline = {
      \ 'colorscheme': 'dogrun',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ ['readonly', 'relativepath', 'modified'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }


" Easy Align Text By Delimeter
Plug 'junegunn/vim-easy-align'

  " For visual mode (e.g. vip<Enter>)
  vmap <Enter>   <Plug>(EasyAlign)

  " For normal mode, with Vim movement (e.g. <Leader>aip)
  nmap <Leader>a <Plug>(EasyAlign)

" Easy Motion Movements
" Needs example.
Plug 'easymotion/vim-easymotion'

" Show the register when using " or @
Plug 'junegunn/vim-peekaboo'

" */# highlights without moving curosr, highlight removed moving cursor
" Plug 'junegunn/vim-slash'

" File explorer sidebar
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }

  " Just show the side bar
  map <Leader>fl :NERDTreeToggle<cr>
  noremap <Leader>fl :NERDTreeToggle<cr>

  " Find current file
  map <Leader>ff :NERDTreeFind<cr>
  noremap <Leader>ff :NERDTreeFind<cr>

" Fuzzy finder / (move to denite?)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

  map <Leader>fs :FZF<cr>
  noremap <Leader>fs :FZF<cr>

  map <Leader>ts :Tags<cr>
  noremap <Leader>ts :Tags<cr>

  map <Leader>bs :Buffers<cr>
  noremap <Leader>bs :Buffers<cr>

" Plug 'w0rp/ale'
" let g:ale_linters = {}
" let g:ale_lint_delay = 500

" Present in kitty correctly
if !empty($KITTY_WINDOW_ID) 
  highlight ALEWarning cterm=undercurl gui=undercurl guisp=#81a2be
  highlight ALEError cterm=undercurl gui=undercurl guisp=#cc6666
endif



" Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-fugitive'
set diffopt+=vertical
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rails'

augroup vimrails
  au!
  autocmd FileType ruby map <Leader>gt :execute "e " . fnameescape(rails#buffer().alternate())<cr>
  autocmd FileType ruby noremap <Leader>gt :execute "e " . fnameescape(rails#buffer().alternate())<cr>
augroup end



" Allows you to use . to repeat most things
"
Plug 'tpope/vim-repeat'

" Allows you to add/change surrounding syntax
" try yss" css' -- prefix is ys/cs <motion>
Plug 'tpope/vim-surround'

" Allows you to comment things out easily
" try: gcc -- generally gc <motion>
Plug 'tpope/vim-commentary'



Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_node_path = substitute(system('which node'), '\n', '', 'g')

inoremap <silent><expr> <c-x><c-u> coc#refresh()
inoremap <silent><expr> <c-x><c-o> coc#refresh()


" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <leader>cn <Plug>(coc-rename)

xmap <leader>gq  <Plug>(coc-format-selected)
nmap <leader>gq  <Plug>(coc-format-selected)

nmap <leader>qf  <Plug>(coc-fix-current)

nnoremap <silent> <leader>ld  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <leader>so :<C-u>CocList outline<cr>
nnoremap <silent> <leader>ss :<C-u>CocList -I symbols<cr>





" Check for lang servers.
" Ruby - solargraph
" JS - javascript-typescript-langserver


" Salt
Plug 'saltstack/salt-vim'


" SQL
Plug 'vim-scripts/dbext.vim', { 'on': ['DBExecVisualSQL', 'DBExecVisualSQLTopX', 'DBExecSQLUnderCursor', 'DBExecSQLUnderCursorTopX', 'DBExecSQL', 'DBExecRangeSQL', 'DBSelectFromTable', 'DBSelectFromTableWithWhere', 'DBSelectFromTableAskName', 'DBSelectFromTableTopX', 'DBDescribeTable', 'DBDescribeTableAskName', 'DBDescribeProcedure', 'DBDescribeProcedureAskName', 'DBPromptForBufferParameters', 'DBListColumn', 'DBListTable', 'DBListProcedure', 'DBListView', 'DBOrientationToggle', 'DBHistory', 'DBGetStoredProcBody', 'DBGetStoredProcTemplate']}

" Javascript
Plug 'marijnh/tern_for_vim', { 'for': [ 'javascript' ] }
Plug 'pangloss/vim-javascript', { 'for': [ 'javascript' ] }

" Typescript
"
Plug 'leafgarland/typescript-vim'

" Creative writing concentration.
Plug 'junegunn/goyo.vim', { 'on': ['Goyo', 'GoyoEnter', 'GoyoLeave'] }
Plug 'junegunn/limelight.vim', { 'on': ['Limelight'] }


Plug 'sheerun/vim-polyglot'



Plug 'janko/vim-test'
let test#strategy = 'neovim'
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>


Plug 'bumaociyuan/vim-swift'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {
       \ 'server': system("echo http://`docker-machine inspect | jq -r .Driver.IPAddress`:37176")
       \ },
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {}
    \ }

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }




" let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_smart_case = 1
" let g:deoplete#disable_auto_complete = 1
" inoremap <expr> <C-X><C-O> deoplete#mappings#manual_complete()
Plug 'gyim/vim-boxdraw'

call plug#end()

