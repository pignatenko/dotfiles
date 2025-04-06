command = {}

function command.run ()
  local vimp = require('vimp');

  -- This pisses me off so much D is d$ C is c$ A is $a but Y is yy. WHY?
  vimp.noremap({'override'}, 'Y', 'y$')

  -- jk should navigate wrapped text correctly
  vimp.nnoremap( 'j', 'gj')
  vimp.nnoremap( 'k', 'gk')
  vimp.vnoremap( 'j', 'gj')
  vimp.vnoremap( 'k', 'gk')

  -- insert mode up and down arrows should navigate wrapped text correctly
  vimp.inoremap( '<Down>', '<C-o>gj')
  vimp.inoremap( '<Up>', '<C-o>gk')

  -- Missing readline nav on command
  vimp.cnoremap( '<C-a>', '<Home>')
  vimp.cnoremap( '<C-e>', '<End>')
  vimp.cnoremap( '<M-b>', '<C-Left>')
  vimp.cnoremap( '<M-f>', '<C-Right>')

  -- TODO Do we need this?
  -- " Add folds to gutter?
  -- " Toggle gutter

  -- function! GutterToggle()
  --   set invnumber invrelativenumber
  --   if &foldcolumn
  --       set foldcolumn=0
  --   else
  --       set foldcolumn=4
  --   endif
  -- endfunction

  -- nnoremap <Leader>vgt :call GutterToggle()<cr>

  -- " Only absolute
  -- nnoremap <Leader>vgn :set number invrelativenumber<cr>

  -- " Default
  -- nnoremap <Leader>vgr :set number relativenumber foldcolumn=2<cr>


  -- file completion relative to editing file rather than cwd of vim
  vimp.inoremap( '<C-X><C-F>', '<C-O>:lcd %:p:h<CR><C-X><C-F>')

  -- TODO Do we need this?
  -- " " Toggle between test and implementation file
  -- " nnoremap <leader>`t
  -- " nnoremap <leader>'t


  -- Copy relative file name to global clip
  vimp.nnoremap( '<leader>fyn', ':silent !echo "%" | pbcopy<cr>')

  local opts = { noremap=true, silent=true }
  vim.keymap.set('n', '<leader>fyn', ':silent !echo "%" | pbcopy<cr>', opts)

  -- Copy file contents to global clip
  vimp.nnoremap( '<leader>fya', 'gg"+yG')

  -- Copy to clipboard
  vimp.vnoremap(  '<leader>y',  '"+y')
  vimp.nnoremap(  '<leader>Y',  '"+y$')
  vimp.nnoremap(  '<leader>y',  '"+y')

  -- Paste from clipboard
  vimp.nnoremap( '<leader>p', '"+p')
  vimp.nnoremap( '<leader>P', '"+P')
  vimp.vnoremap( '<leader>p', '"+p')
  vimp.vnoremap( '<leader>P', '"+P')
end

return command
