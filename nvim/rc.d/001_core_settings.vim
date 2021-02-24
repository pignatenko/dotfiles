scriptencoding utf-8
filetype plugin on
filetype indent on

runtime! macros/matchit.vim

syntax on
set completeopt=menuone,menu,longest,preview
" set statusline=[%{&ff}\|%Y]\ <%<%F\ :\ %L>\ %m%r%w%=\ [\%03.3b\ #\%02.2B][%04l,%04v]\ 

" let tern#command=[]


let mapleader = " "
set relativenumber
set autoread
set autoindent
set incsearch
set shiftround
set scrolloff=1
set sidescrolloff=5
set display+=lastline
set lazyredraw
set ttyfast
set nu
set noautochdir
set history=1000
set lbr
set formatoptions=l
set showmode
set showcmd
set showmatch
set textwidth=80
set backspace=indent,eol,start
set wildmenu
set shiftwidth=2
set softtabstop=2
set tabstop=2
set smarttab
set expandtab
set autoindent
set wildmode=list
set ignorecase
set smartcase
set noruler
set hlsearch
set incsearch
set hidden
set linespace=3
set laststatus=2
set numberwidth=6
set foldmethod=syntax
set foldlevelstart=99
set foldcolumn=2
set completeopt=longest,menuone

let &showbreak = '   └► '



set listchars=tab:»\ ,trail:·
set list


set title
