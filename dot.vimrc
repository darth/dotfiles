" vim:foldmethod=marker:foldlevel=0
" NeoBundle {{{
 if has('vim_starting')
   set nocompatible
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-session'
NeoBundle 'gcmt/taboo.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'szw/vim-tags'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'chrisbra/csv.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'bling/vim-airline'
NeoBundle 'bling/vim-bufferline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'vim-scripts/bufkill.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'lervag/vimtex'
NeoBundle 'Rip-Rip/clang_complete'
NeoBundle 'vim-scripts/a.vim'
NeoBundle 'nelstrom/vim-visual-star-search'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-entire'
NeoBundle 'fatih/vim-go'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'burnettk/vim-angular'
NeoBundle 'vim-scripts/modelica'
NeoBundle 'EinfachToll/DidYouMean'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck
"}}}
" Loading of local settings {{{
set exrc
set secure
" }}}
" Directories and files {{{
set viminfo=!,'50,n~/.vim/viminfo
set dir=~/.vim/tmp//
set backupdir=~/.vim/tmp//
if version >= 703
  set undofile
  set undodir=~/.vim/undo//
endif
" }}}
" Encodings {{{
let &termencoding=&encoding
set encoding=utf-8
set fileencodings=utf-8,cp1251,koi8-r,latin1
" }}}
" Numbering {{{
set number
if version >= 703
  set relativenumber
  if version>=704
    nnoremap <Leader>n :set rnu!<CR>:set nu!<CR>
  else
    nnoremap <Leader>n :set rnu!<CR>
  endif
else
  nnoremap <Leader>n :set nu!<CR>
endif
" }}}
" Indentation {{{
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
" }}}
" Searching/Replacing {{{
set smartcase
set ignorecase
set incsearch
set showmatch
set hlsearch
set gdefault
nnoremap <Leader><Space> :noh<CR>
nnoremap & :&&<CR>
xnoremap & :&&<CR>
" }}}
" Colors {{{
if !has("gui_running")
  set t_Co=256
endif
set background=dark
colorscheme solarized
" }}}
" Visual stuff {{{
" Enable syntax highlighting.
syntax on
" Hide uganda message
set shortmess+=I
" Always show statusline.
set laststatus=2
" Show at least 5 lines below and above cursor.
set scrolloff=5
" Show invisible chars.
set list
set listchars=tab:▸\ ,eol:¬
" Show current position in status line.
set ruler
" Show current line.
set cursorline
" Show commands.
set showcmd
" Show modes.
set showmode
" Enable soft wrapping of text.
set wrap
if v:version >= 703
  set colorcolumn=81
endif
" Toggle invisible symbols
nnoremap <Leader>i :set list!<CR>
" }}}
" Clipboard {{{
if has("macunix")
  nnoremap <Leader>y :let @+ = @"<CR>
  nnoremap <Leader>p :let @" = @+<CR>
else
  nnoremap <Leader>y :call system('rcopy', @")<CR>
  nnoremap <Leader>p :let @" = system('rpaste')<CR>
endif
" }}}
" Misc settings {{{
" Fast terminal connection.
set ttyfast
" Make buffer hidden when abandoned.
set hidden
" Improve command line completion.
set wildmenu
set wildmode=list:longest
" Specify what backspace can erase.
set backspace=indent,eol,start
" Enable reading man pages.
runtime ftplugin/man.vim
" Enable jumps to matching objects (tags, parentheses, etc).
runtime macros/matchit.vim
" Completion.
set completeopt-=preview
" }}}
" {{{ vim-session
let g:session_autosave = 'no'
" }}}
" clang_complete {{{
let g:clang_complete_macros = 1
let g:clang_use_library = 1
if has('mac')
  let g:clang_library_path = '/Library/Developer/CommandLineTools/usr/lib/'
endif
" }}}
" airline {{{
let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'
let g:airline_exclude_preview = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
" }}}
" bufferline {{{
let g:bufferline_echo = 0
" }}}
" ctrlp {{{
let g:ctrlp_map = '<Leader>f'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_extensions = ['tag']
nnoremap <Leader>t :CtrlPTag<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
" }}}
" fugitive {{{
nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gc :Gcommit<CR>
nnoremap <silent> <Leader>gd :Gdiff<CR>
" }}}
" syntastic {{{
let g:syntastic_check_on_open=1
" }}}
" latex {{{
let g:tex_flavor = 'latex'
let g:tex_comment_nospell= 1
let g:latex_fold_enabled = 1
if has('mac')
  let g:vimtex_view_general_viewer = '/Users/darth/Applications/Skim.app/Contents/SharedSupport/displayline'
  let g:vimtex_view_general_options = '@line @pdf @tex'
endif
" }}}
" {{{ gundo
nnoremap <Leader>u :GundoToggle<CR>
" }}}
" Autocommands {{{
" Hardwrapping for tex/latex.
au FileType tex setlocal textwidth=80 spell spelllang=en_us
" PEP8
au FileType python setlocal ts=4 sts=4 sw=4
" Set filetype for gnuplot scripts.
au BufNewFile,BufRead *.gnuplot setf gnuplot
" Set filetype for modelica files.
au BufNewFile,BufRead *.mo setlocal ft=modelica
" Restore cursor position.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" Settings for quickfix.
au Filetype qf setlocal nonumber colorcolumn=
" }}}
" Functions {{{
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line('.')
  let c = col('.')
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position.
  let @/=_s
  call cursor(l, c)
endfunction
" }}}
" Misc mappings {{{
" Strip trailing whitespaces.
nnoremap <silent> <Leader>s :call Preserve("%s/\\s\\+$//e")<CR>
" Help.
nnoremap <Leader>h :vert help 
" Toggle fold.
nnoremap <Space> za
" Select last edited text.
nnoremap gV `[v`]
" }}}
" vimrc.local {{{
if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif
" }}}
