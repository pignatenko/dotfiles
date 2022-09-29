plugin = {
  'iamcco/markdown-preview.nvim',
  config = function ()
    vim.cmd([[
      call mkdp#util#install()
      let g:mkdp_preview_options = {
        \ 'mkit': {},
        \ 'katex': {},
        \ 'uml': { 'server': 'http://localhost:37176'},
        \ 'maid': {},
        \ 'disable_sync_scroll': 0,
        \ 'sync_scroll_type': 'middle',
        \ 'hide_yaml_meta': 1,
        \ 'sequence_diagrams': {},
        \ 'flowchart_diagrams': {},
        \ 'content_editable': v:false,
        \ 'disable_filename': 0,
        \ 'toc': {}
        \ }

    ]])
  end
}

return plugin
