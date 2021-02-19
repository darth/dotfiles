local fn = vim.fn
local cmd = vim.cmd

cmd 'packadd paq-nvim'
local paq = require'paq-nvim'.paq
paq {'savq/paq-nvim', opt = true}

paq 'tweekmonster/startuptime.vim'

paq 'arcticicestudio/nord-vim'

paq 'tpope/vim-commentary'
paq 'tpope/vim-repeat'
paq 'tpope/vim-surround'
paq 'tpope/vim-fugitive'
paq 'tpope/vim-obsession'
paq 'tpope/vim-projectionist'
paq 'tpope/vim-dispatch'
paq 'radenling/vim-dispatch-neovim'

paq 'kana/vim-textobj-user'
paq 'kana/vim-textobj-function'
paq 'kana/vim-textobj-entire'

paq 'nathanaelkane/vim-indent-guides'
paq 'kyazdani42/nvim-web-devicons'
paq 'akinsho/nvim-bufferline.lua'
paq 'hoob3rt/lualine.nvim'

paq 'junegunn/fzf'
paq 'junegunn/fzf.vim'

paq 'vim-utils/vim-husk'
paq 'editorconfig/editorconfig-vim'

paq 'pboettch/vim-cmake-syntax'
paq 'lifepillar/pgsql.vim'
paq 'tweekmonster/braceless.vim'

paq 'vim-scripts/modelica'
paq 'bohlender/vim-smt2'
paq 'wannesm/wmnusmv.vim'
paq {
  'mclab/vim-properties-syntax',
  url = 'https://bitbucket.org/mclab/vim-properties-syntax'
}

paq {
  'nvim-treesitter/nvim-treesitter',
  run = function() return cmd 'TSUpdate' end
}

if (vim.env.DEVMODE) then
  paq 'neovim/nvim-lspconfig'
  paq 'onsails/lspkind-nvim'
  paq 'hrsh7th/vim-vsnip'
  paq 'hrsh7th/nvim-compe'
  paq 'squareys/vim-cmake'
  paq 'lervag/vimtex'
  paq {'iamcco/markdown-preview.nvim', run = fn['mkdp#util#install']}
end