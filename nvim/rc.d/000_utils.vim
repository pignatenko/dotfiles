scriptencoding utf-8


" Check that a command exists, if not throw an error
function! DoesCommandExist(name)
  if !executable(a:name)
    echoerr "ERROR: command " . a:name .  " was not found!"
  endif
endfunction

let started = 0
function! StartServer(command)
  if !started
    started = jobstart(a:command)
  endif
endfunction

function! TestFunc(filename, template)
python3 << _EOF_
from string import Template
from pathlib import Path
import vim

vim_project_path_template = Template(vim.eval('a:template'))
vim_project_path_filepath = Path(vim.eval('a:filename'))

vim_project_path_template_args = {
  'drive': vim_project_path_filepath.drive,
  'root': vim_project_path_filepath.root,
  'anchor': vim_project_path_filepath.anchor,
  'parents': vim_project_path_filepath.parents,
  'parent': vim_project_path_filepath.parent,
  'name': vim_project_path_filepath.name,
  'suffix': vim_project_path_filepath.suffix,
  'suffixes': vim_project_path_filepath.suffixes,
  'stem': vim_project_path_filepath.stem
}
vim.command('let template_return = "%s"' % vim_project_path_template.safe_substitute(**vim_project_path_template_args))
_EOF_
return template_return
endfunction

function! Example(arg)
python3 << _EOF_

import vim
print "arg is " + vim.eval("a:arg")

_EOF_
endfunction
