scriptencoding utf-8


let load_script = ''
for load_script in split(globpath("$HOME/.config/nvim/rc.d", '*.vim'), '\n')
  exec 'source' load_script
endfor
