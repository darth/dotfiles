local lualine = require 'lualine'

lualine.options.theme = 'nord'
lualine.sections.lualine_x = {
  'encoding', 'fileformat', 'filetype', {'diagnostics', sources = {'nvim_lsp'}},
}
lualine.sections.lualine_z = {
  {'location', icon = ''}
}
lualine.options.section_separators = {'', ''}
lualine.options.component_separators = {'', ''}
lualine.extensions = {'fzf'}
lualine.status()
