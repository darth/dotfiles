" vim:foldmethod=marker:foldlevel=0
" {{{ dein
if &compatible
  set nocompatible
endif

" Required:
set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.local/share/dein')
  call dein#begin('~/.local/share/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.local/share/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('lifepillar/vim-solarized8')
  call dein#add('gcmt/taboo.vim')
  call dein#add('chrisbra/csv.vim')
  call dein#add('sjl/gundo.vim')
  call dein#add('bling/vim-airline')
  call dein#add('bling/vim-bufferline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('vim-scripts/bufkill.vim')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-abolish')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-obsession')
  call dein#add('tpope/vim-dispatch')
  call dein#add('vim-scripts/a.vim')
  call dein#add('nelstrom/vim-visual-star-search')
  call dein#add('kana/vim-textobj-user')
  call dein#add('kana/vim-textobj-function')
  call dein#add('kana/vim-textobj-entire')
  call dein#add('pangloss/vim-javascript')
  call dein#add('othree/javascript-libraries-syntax.vim')
  call dein#add('burnettk/vim-angular')
  call dein#add('vim-scripts/modelica')
  call dein#add('vim-utils/vim-husk')
  call dein#add('tmux-plugins/vim-tmux')
  call dein#add('mxw/vim-jsx')
  call dein#add('junegunn/fzf.vim')
  call dein#add('embear/vim-localvimrc')
  call dein#add('pboettch/vim-cmake-syntax')
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('Valloric/ListToggle')
  call dein#add('https://bitbucket.org/mclab/vim-properties-syntax')

  if has('nvim')
    call dein#add('oblitum/YouCompleteMe', {
    \   'build': './install.sh --clang-completer --gocode-completer',
    \   'type__depth': 1,
    \   'timeout': 600,
    \   'merged': 0
    \ })
    " call dein#add('Shougo/deoplete.nvim')
    " call dein#add('Shougo/neosnippet')
    " call dein#add('Shougo/neosnippet-snippets')
    " call dein#add('tweekmonster/deoplete-clang2') call dein#add('zchee/deoplete-clang') call dein#add('zchee/deoplete-jedi')
    " call dein#add('zchee/deoplete-go')
    " call dein#add('wokalski/autocomplete-flow')
    " call dein#add('neomake/neomake')
    call dein#add('sbdchd/neoformat')
    call dein#add('ludovicchabant/vim-gutentags')
    call dein#add('darth/vim-cmake')
    call dein#add('JamshedVesuna/vim-markdown-preview')
    call dein#add('Rykka/riv.vim')
    call dein#add('lervag/vimtex')
    call dein#add('dbgx/lldb.nvim')
  endif

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
" }}}
" Sessions {{{
set sessionoptions+=tabpages,globals
" }}}
" Directories and files {{{
if !has('nvim')
  set viminfo=!,'50,n~/.vim/viminfo
  set dir=~/.vim/tmp//
  set backupdir=~/.vim/tmp//
  if version >= 703
    set undofile
    set undodir=~/.vim/undo//
  endif
else
  set undofile
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
" {{{ Modeline
set modeline
" }}}
" Indentation {{{
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
" }}}
" Mouse {{{
set mouse=a
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
if !has('gui_running')
  set t_Co=256
endif
if !has('nvim') && v:version >= 800
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
if has('termguicolors')
  set termguicolors
endif
colorscheme solarized8_dark
let g:solarized_term_italics=1
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
nnoremap <Leader>y :call system("$COPY_COMMAND", @")<CR>
nnoremap <Leader>p :let @" = system("$PASTE_COMMAND")<CR>
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
" {{{ FZF
set rtp+=~/.fzf
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>t :Tags<CR>
" }}}
" {{{ deoplete
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#complete_method = 'omnifunc'
" }}}
" {{{ deoplete-clang
" let g:deoplete#sources#clang#libclang_path = '/usr/local/opt/llvm/lib/libclang.dylib'
" let g:deoplete#sources#clang#clang_header = '/usr/local/opt/llvm/lib/clanginclude'
" }}}
" {{{ neosnippet
let g:neosnippet#enable_completed_snippet = 1
" }}}
" tags {{{
let g:gutentags_ctags_tagfile='.tags'
let g:gutentags_ctags_extra_args=['--c-kinds=+px']
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
" fugitive {{{
nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gc :Gcommit<CR>
nnoremap <silent> <Leader>gd :Gdiff<CR>
" }}}
" latex {{{
let g:tex_flavor = 'latex'
let g:tex_comment_nospell= 1
let g:latex_fold_enabled = 1
if has('mac')
  let g:vimtex_view_general_viewer = 'displayline'
  let g:vimtex_view_general_options = '-g -r @line @pdf @tex'
endif
let g:vimtex_compiler_latexmk = {'callback' : 0}
" }}}
" {{{ gundo
if has('python3')
  let g:gundo_prefer_python3=1
endif
nnoremap <Leader>u :GundoToggle<CR>
" }}}
" {{{ markdown
let vim_markdown_preview_browser='Safari'
let vim_markdown_preview_github=1
 " }}}
" {{{ localvimrc
let g:localvimrc_sandbox=0
let g:localvimrc_persistent=1
" }}}
" {{{ cmake
let g:cmake_export_compile_commands = 1
let g:cmake_ycm_symlinks = 1
" }}}
" {{{ jsx
let g:jsx_ext_required = 0
" }}}
" {{{ neoformat
let g:neoformat_try_formatprg = 1
" }}}
" YouCompleteMe {{{
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_key_invoke_completion = '<TAB>'
let g:ycm_always_populate_location_list=1
" }}}
" {{{ lldb
nmap <M-b> <Plug>LLBreakSwitch
vmap <F2> <Plug>LLStdInSelected
nnoremap <F4> :LLstdin<CR>
nnoremap <F5> :LLmode debug<CR>
nnoremap <S-F5> :LLmode code<CR>
nnoremap <F8> :LL continue<CR>
nnoremap <S-F8> :LL process interrupt<CR>
nnoremap <F9> :LL print <C-R>=expand('<cword>')<CR>
vnoremap <F9> :<C-U>LL print <C-R>=lldb#util#get_selection()<CR><CR>
nnoremap <F10> :LL step<CR>
nnoremap <F11> :LL finish<CR>
nnoremap <F12> :LL next<CR>
" }}}
" {{{ vim-flow
let g:flow#autoclose = 1
" }}}
" Autocommands {{{
" Hardwrapping for tex/latex.
au FileType tex setlocal textwidth=80 spell spelllang=en_gb
" PEP8
au FileType python setlocal ts=4 sts=4 sw=4
" Use prettier for js formatting
au FileType javascript,javascript.jsx setlocal formatprg=prettier\ --stdin\ --parser\ flow\ --single-quote\ --trailing-comma\ all
" Comments for cmake files
au FileType cmake setlocal commentstring=#\ %s
" Set filetype for gnuplot scripts.
au BufNewFile,BufRead *.gnuplot setf gnuplot
" Set filetype for modelica files.
au BufNewFile,BufRead *.mo setlocal ft=modelica
" Restore cursor position.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" Settings for quickfix.
au Filetype qf setlocal nonumber colorcolumn=
" Golang
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)
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
