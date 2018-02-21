" vim:foldmethod=marker:foldlevel=0
" {{{ minpac
if &compatible
  set nocompatible
endif

if exists('*minpac#init')
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  call minpac#add('icymind/NeoSolarized')

  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('tpope/vim-abolish')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('tpope/vim-obsession')
  call minpac#add('tpope/vim-dispatch')

  call minpac#add('kana/vim-textobj-user')
  call minpac#add('kana/vim-textobj-function')
  call minpac#add('kana/vim-textobj-entire')

  call minpac#add('junegunn/fzf.vim')
  call minpac#add('junegunn/goyo.vim')
  call minpac#add('junegunn/limelight.vim')

  call minpac#add('roxma/nvim-completion-manager')
  call minpac#add('roxma/ncm-clang')
  call minpac#add('sirver/ultisnips')
  call minpac#add('w0rp/ale')

  call minpac#add('bling/vim-airline')
  call minpac#add('bling/vim-bufferline')
  call minpac#add('vim-airline/vim-airline-themes')

  call minpac#add('gcmt/taboo.vim')
  call minpac#add('sjl/gundo.vim')
  call minpac#add('vim-scripts/bufkill.vim')
  call minpac#add('vim-scripts/a.vim')
  call minpac#add('nelstrom/vim-visual-star-search')
  call minpac#add('vim-utils/vim-husk')
  call minpac#add('embear/vim-localvimrc')
  call minpac#add('editorconfig/editorconfig-vim')
  call minpac#add('Valloric/ListToggle')

  call minpac#add('chrisbra/csv.vim')
  call minpac#add('vim-scripts/modelica')
  call minpac#add('pboettch/vim-cmake-syntax')
  call minpac#add('tmux-plugins/vim-tmux')
  call minpac#add('https://bitbucket.org/mclab/vim-properties-syntax')

  call minpac#add('pangloss/vim-javascript')
  call minpac#add('othree/javascript-libraries-syntax.vim')
  call minpac#add('mxw/vim-jsx')

  if has('nvim')
    call minpac#add('radenling/vim-dispatch-neovim')
    call minpac#add('sbdchd/neoformat')
    call minpac#add('ludovicchabant/vim-gutentags')
    call minpac#add('darth/vim-cmake')
    call minpac#add('JamshedVesuna/vim-markdown-preview')
    call minpac#add('Rykka/riv.vim')
    call minpac#add('lervag/vimtex')
  endif
endif

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

filetype plugin indent on
syntax enable
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
let g:neosolarized_italic = 1
set background=dark
colorscheme NeoSolarized
" }}}
" Visual stuff {{{
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
" {{{ nvim-completion-manager
let g:cm_matcher = { 'module': 'cm_matchers.fuzzy_matcher', 'case': 'smartcase' }
let g:cm_completekeys = "\<Plug>(cm_omnifunc)"
let g:UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0
" optional
inoremap <silent> <c-u> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>
" }}}
"{{{ ale
let g:ale_linters = {
  \ 'c': ['clang']
  \}
autocmd BufEnter *.c,*.h let g:ale_c_clang_options = join(ncm_clang#compilation_info()['args'], ' ') | ALELint
" }}}
" tags {{{
let g:gutentags_ctags_tagfile='.tags'
let g:gutentags_ctags_extra_args=['--c-kinds=+px']
let g:gutentags_project_root=['build']
" }}}
" airline {{{
let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'
let g:airline_exclude_preview = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#ale#enabled = 1
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
" }}}
" {{{ jsx
let g:jsx_ext_required = 0
" }}}
" {{{ neoformat
let g:neoformat_try_formatprg = 1
" }}}
" {{{ vim-flow
let g:flow#autoclose = 1
" }}}
" {{{ Goyo
function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
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
au FileType gnuplot setlocal commentstring=#\ %s
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
