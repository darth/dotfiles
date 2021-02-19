local utils = require 'my.utils'
local cmd = vim.cmd
local g = vim.g
local env = vim.env
local o = utils.opts.o
local b = utils.opts.b
local w = utils.opts.w
local map = utils.map

o.hidden = true
b.undofile = true
o.mouse = 'a'
g.mapleader = '\\'
g.loaded_python_provider = 0
g.python3_host_prog = 'python3'
w.list = true
w.listchars = 'tab:▸\\ ,eol:¬'
w.cursorline = true
w.colorcolumn = '81'
o.wildmenu = true
o.wildmode = 'list:longest'
o.backspace = 'indent,eol,start'
map('c', '<c-p>', 'wildmenumode() ? "<c-p>" : "<up>"', {expr = true})
map('c', '<c-n>', 'wildmenumode() ? "<c-n>" : "<down>"', {expr = true})

cmd 'autocmd TextYankPost * lua vim.highlight.on_yank {on_visual = false, timeout = 500}'
map('n', '<space>', 'za', {})

-- g.indent_guides_enable_on_vim_startup = 1

require 'my.plugins'
require 'my.search'
require 'my.numbering'
require 'my.colors'
require 'my.clipboard'
require 'my.restore'
require 'my.quickfix'
require 'my.spell'
require 'my.statusline'
require 'my.gui'
require 'my.textobj'
require 'my.unimpaired'
require 'my.bufdel'
require 'my.fugitive'
require'my.indent'.setup {width = 2}
require'my.terminal'.setup {perc = 0.8, keymap = '<leader>t'}
require'bufferline'.setup {options = {always_show_bufferline = false}}

cmd 'runtime fzf.vim'

env.VISUAL = 'nvr -cc split --remote-wait +"set bufhidden=wipe"'

require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'bash', 'c', 'cpp', 'css', 'go', 'json', 'lua', 'javascript', 'python',
    'tsx'
  },
  highlight = {enable = true, disable = {}}
}

if (env.DEVMODE) then
  require'my.completion'.setup {
    complete = '<c-x><c-o>',
    confirm = '<c-y>',
    close = '<c-e>',
    snip_next = '<c-j>',
    snip_prev = '<c-k>'
  }
  require 'my.lsp'
  require'lspkind'.init {}
  require 'my.vimtex'
end