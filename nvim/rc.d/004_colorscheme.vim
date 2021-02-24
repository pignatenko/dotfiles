if (has("termguicolors"))
 set termguicolors
endif

"""" enable the theme
let g:palenight_terminal_italics=1
set background=dark
syntax enable
colorscheme dogrun


hi CursorLineNr guifg=#7cbe8c ctermfg=108
hi LineNr guifg=#535f98 ctermfg=61 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi FoldColumn guifg=#545c8c ctermfg=60 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi IncSearch guibg=#9ea3c0 ctermbg=60
hi Search guifg=#9ea3c0 ctermfg=60 guibg=#5d6ad8 ctermbg=62
