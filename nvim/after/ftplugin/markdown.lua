local settings = require("lib/settings")
settings.apply(settings.WINDOW)
settings.apply(settings.BUFFER)
vim.bo.textwidth = 0
