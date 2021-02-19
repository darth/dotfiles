local map = require'my.utils'.map

map('n', '<leader>gs', '<cmd>Gstatus<CR>', {silent = true})
map('n', '<leader>gc', '<cmd>Gcommit<CR>', {silent = true})
map('n', '<leader>gd', '<cmd>Gdiff<CR>', {silent = true})
