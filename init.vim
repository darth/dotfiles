" vim:foldmethod=marker:foldlevel=0
" {{{ minpac
if &compatible
  set nocompatible
endif

if exists('*minpac#init')
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  call minpac#add('darth/oceanic-next')

  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('airblade/vim-gitgutter')
  call minpac#add('jreybert/vimagit')
  call minpac#add('tpope/vim-abolish')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('tpope/vim-obsession')
  call minpac#add('tpope/vim-dispatch')
  call minpac#add('radenling/vim-dispatch-neovim')

  call minpac#add('kana/vim-textobj-user')
  call minpac#add('kana/vim-textobj-function')
  call minpac#add('kana/vim-textobj-entire')

  call minpac#add('junegunn/fzf')
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('junegunn/goyo.vim')
  call minpac#add('junegunn/limelight.vim')

  call minpac#add('gcmt/taboo.vim')
  call minpac#add('vim-airline/vim-airline')
  call minpac#add('vim-airline/vim-airline-themes')
  call minpac#add('edkolev/tmuxline.vim')
  call minpac#add('ryanoasis/vim-devicons')
  call minpac#add('yggdroot/indentline')

  call minpac#add('sjl/gundo.vim')
  call minpac#add('vim-scripts/bufkill.vim')
  call minpac#add('schickling/vim-bufonly')
  call minpac#add('vim-scripts/a.vim')
  call minpac#add('nelstrom/vim-visual-star-search')
  call minpac#add('vim-utils/vim-husk')
  call minpac#add('embear/vim-localvimrc')
  call minpac#add('editorconfig/editorconfig-vim')
  call minpac#add('Valloric/ListToggle')
  call minpac#add('mhinz/vim-grepper')

  call minpac#add('elzr/vim-json')
  call minpac#add('chrisbra/csv.vim')
  call minpac#add('vim-scripts/modelica')
  call minpac#add('pboettch/vim-cmake-syntax')
  call minpac#add('tmux-plugins/vim-tmux')
  call minpac#add('https://bitbucket.org/mclab/vim-properties-syntax')

  call minpac#add('pangloss/vim-javascript')
  call minpac#add('othree/javascript-libraries-syntax.vim')
  call minpac#add('mxw/vim-jsx')

  if has('mac')
    call minpac#add('darth/LanguageClient-neovim', {
    \ 'branch': 'darth',
    \ 'do': {-> system('make release')},
    \ })
    call minpac#add('shougo/deoplete.nvim')
    call minpac#add('sirver/ultisnips')
    call minpac#add('sbdchd/neoformat')
    call minpac#add('darth/vim-cmake')
    call minpac#add('euclio/vim-markdown-composer', {
    \ 'do': {-> system('cargo build --release')},
    \ })
    call minpac#add('Rykka/riv.vim')
    call minpac#add('Rykka/InstantRst')
    call minpac#add('lervag/vimtex')
    call minpac#add('neovimhaskell/haskell-vim')
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
set undofile
" }}}
" Encodings {{{
let &termencoding=&encoding
set encoding=utf-8
set fileencodings=utf-8,cp1251,koi8-r,latin1
" }}}
" Numbering {{{
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
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
" {{{ Clipboard
let g:clipboard = {
\ 'name': 'smartClipboard',
\ 'copy': {
\  '+': 'rcopy',
\ },
\ 'paste': {
\  '+': 'rpaste',
\ }
\}
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
if has('termguicolors')
  set termguicolors
endif
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
set background=dark
colorscheme OceanicNext
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
set colorcolumn=81
set signcolumn=yes
" Toggle invisible symbols
nnoremap <Leader>i :set list!<CR>
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
" Speed up update time.
set updatetime=100
" }}}
" {{{ FZF
command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>t :Tags<CR>
" }}}
" {{{ deoplete
let g:deoplete#enable_at_startup = 1
" }}}
" {{{ languageclient
let g:LanguageClient_serverCommands = {
\ 'c': ['cquery', '--log-file=/tmp/cq.log'],
\ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
\ 'python': ['pyls'],
\ 'haskell': ['hie', '--lsp']
\ }
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_diagnosticsList = 'Location'
let g:LanguageClient_rootMarkers = {
\ 'c': ['build'],
\ 'cpp': ['build'],
\ }
function! LanguageClientInit()
  set signcolumn=yes
  nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
  nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
  nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
  set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
  let g:LanguageClient_started = 1
endfunction
function! LanguageClientDeinit()
  set signcolumn=auto
  unmap K
  unmap gd
  unmap <F2>
  set formatexpr=''
  let g:LanguageClient_started = 0
endfunction
augroup LanguageClient_config
  autocmd!
  autocmd User LanguageClientStarted call LanguageClientInit()
  autocmd User LanguageClientStopped call LanguageClientDeinit()
augroup END
function! LanguageClientToggle()
  if get(g:, 'LanguageClient_started', 0) == 0
    LanguageClientStart
  else
    LanguageClientStop
  endif
endfunction
autocmd FileType c,cpp,python,haskell,rust nnoremap <buffer> <Leader>ll :call LanguageClientToggle()<CR>
" }}}
" {{{ ultisnips
function! ExpandLspSnippet()
    call UltiSnips#ExpandSnippetOrJump()
    if !pumvisible() || empty(v:completed_item)
        return ''
    endif

    " only expand Lsp if UltiSnips#ExpandSnippetOrJump not effect.
    let l:value = v:completed_item['word']
    let l:matched = len(l:value)
    if l:matched <= 0
        return ''
    endif

    " remove inserted chars before expand snippet
    if col('.') == col('$')
        let l:matched -= 1
        exec 'normal! ' . l:matched . 'Xx'
    else
        exec 'normal! ' . l:matched . 'X'
    endif

    if col('.') == col('$') - 1
        " move to $ if at the end of line.
        call cursor(line('.'), col('$'))
    endif

    " expand snippet now.
    call UltiSnips#Anon(l:value)
    return ''
endfunction
imap <C-k> <C-R>=ExpandLspSnippet()<CR>
" }}}
" airline {{{
let g:airline_powerline_fonts = 1
let g:airline_theme = 'oceanicnext'
let g:airline_exclude_preview = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#fugitiveline#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#taboo#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:taboo_tabline = 0
" }}}
" {{{ indentline
let g:indentLine_bufTypeExclude = ['help', 'terminal']
" let g:indentLine_setColors = 0
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
let g:vimtex_compiler_latexmk = {'build_dir' : 'build'}
let g:vimtex_compiler_progname = 'nvr'
" }}}
" {{{ gundo
if has('python3')
  let g:gundo_prefer_python3=1
endif
nnoremap <Leader>u :GundoToggle<CR>
" }}}
" {{{ grepper
let g:grepper = {}
let g:grepper.tools = ['grep', 'git', 'rg']
" Search for the current word
nnoremap <Leader>* :Grepper -cword -noprompt<CR>
" }}}
" {{{ markdown
let g:markdown_composer_autostart = 0
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
" {{{ json
let g:vim_json_syntax_conceal = 0
" }}}
" {{{ neoformat
let g:neoformat_try_formatprg = 1
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
au BufNewFile,BufRead *.h setlocal ft=c
" Restore cursor position.
autocmd BufReadPost *
\ if line("'\"") >= 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif
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
" {{{ VISUAL
let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
" }}}
