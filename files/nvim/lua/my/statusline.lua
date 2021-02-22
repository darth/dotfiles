local lualine = require 'lualine'

lualine.options.theme = 'nord'
lualine.options.section_separators = {'', ''}
lualine.options.component_separators = {'', ''}
lualine.extensions = {'fzf'}
lualine.status()
