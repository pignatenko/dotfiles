core_settings = {}

function core_settings.run ()
  vim.cmd([[
    filetype plugin on
    filetype indent on
    syntax on
    runtime! macros/matchit.vim
  ]])
  -- show absolute number for current line
  vim.o.number = true
  -- show number relative to current line
  vim.o.relativenumber = true
  -- 6 chars for gutter num
  vim.o.numberwidth = 6
  -- automatically warn file changed / reload files
  vim.o.autoread = true
  -- auto indent
  vim.o.autoindent = true
  -- use spaces
  vim.o.expandtab = true
  -- smarter auto indent check space v tab
  vim.o.smarttab = true
  -- 2 spaces for shifting left / right
  vim.o.shiftwidth = 2
  -- round to a multiple of shift width instead of using +2/-2
  vim.o.shiftround = true
  -- 2 spaces for soft tab
  vim.o.softtabstop = 2
  -- 2 spaces for tab
  vim.o.tabstop = 2
  -- show at least 1 line above and below cursor
  vim.o.scrolloff = 1
  -- show at least 5 line above and below cursor when not wrapped
  vim.o.sidescrolloff = 5
  -- show at least 5 line above and below cursor when not wrapped
  vim.o.sidescrolloff = 5
  -- redraw only when needed
  vim.o.lazyredraw = true
  -- your tty is fast
  vim.o.ttyfast = true
  -- show as much as possible of the last last on the screen
  vim.o.display = vim.o.display .. ',lastline'
  -- do not automatically change directory to basedirectory of the file being edited
  vim.o.autochdir = false
  -- set history to 1000 lines
  vim.o.history = 1000
  -- wrap long lines w/ `breakat` chars.
  vim.o.linebreak = true 
  -- do not break long lines in insert mode
  vim.o.formatoptions = 'l'
  -- show editor mode on last line
  vim.o.showmode = true
  -- show the cmd as you're typing on last line
  vim.o.showmode = true
  -- highlight matching brackets
  vim.o.showmatch = true
  -- 80 cols text width
  vim.o.textwidth = 80
  -- backspace over autoindent, end of lines, and start of lines
  vim.o.backspace = 'indent,eol,start'
  -- enhanced commandline compltion menu
  vim.o.wildmenu = true
  vim.o.wildmode = 'list'
  -- ignore case w/ search & replace
  vim.o.ignorecase = true
  -- when using Capitals in search make sure search is case sensitive
  vim.o.smartcase = true
  -- highlight all matches until search is off
  vim.o.hlsearch = true
  -- show where pattern was typed
  vim.o.incsearch = true
  -- allow hidden buffers
  vim.o.hidden = true
  -- add 3 pixels between lines
  vim.o.linespace = 3
  -- Always show last window status on status line
  vim.o.laststatus = 2
  -- Fold with syntax
  vim.o.foldmethod = 'syntax'
  -- Start with 99 fold level (see all)
  vim.o.foldlevelstart = 99
  -- Size of fold column
  vim.o.foldcolumn = '2'
  -- Set complete window to show a menu all the time, insert the longest text match by default
  vim.o.completeopt = 'longest,menu,menuone'
  -- Show special chars using replacements, tab with arrow and trailing space with dot
  vim.o.list = true
  vim.o.listchars = "tab:» ,trail:·,nbsp:+"

  -- Show wrapped breaks with gutter markers like below
  vim.o.showbreak = '   └► '

  -- Set window title
  vim.o.title = true

  -- Use space as mapleader
  vim.g.mapleader = ' '
end

return core_settings
