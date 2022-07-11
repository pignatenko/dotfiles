test = {}

function test.exec ()
  vim.o.number = true
  vim.o.relativenumber = true
  vim.o.numberwidth = 6

  vim.g.mapleader = ' '
end

return test
