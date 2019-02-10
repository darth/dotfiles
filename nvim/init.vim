" vim:foldmethod=marker:foldlevel=0
" minpac {{{
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
  call minpac#add('tpope/vim-abolish')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('tpope/vim-obsession')
  call minpac#add('tpope/vim-projectionist')
  call minpac#add('tpope/vim-scriptease', {'type': 'opt'})
  call minpac#add('tpope/vim-dispatch')
  call minpac#add('radenling/vim-dispatch-neovim')

  call minpac#add('jreybert/vimagit')

  call minpac#add('kana/vim-textobj-user')
  call minpac#add('kana/vim-textobj-function')
  call minpac#add('kana/vim-textobj-entire')
  call minpac#add('tweekmonster/braceless.vim')

  call minpac#add('junegunn/fzf')
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('junegunn/goyo.vim')
  call minpac#add('junegunn/limelight.vim')

  call minpac#add('gcmt/taboo.vim')
  call minpac#add('darth/vim-airline')
  call minpac#add('vim-airline/vim-airline-themes')
  call minpac#add('edkolev/tmuxline.vim')
  call minpac#add('ryanoasis/vim-devicons')
  call minpac#add('yggdroot/indentline')

  call minpac#add('sjl/gundo.vim') " candidate for removal
  call minpac#add('schickling/vim-bufonly')
  call minpac#add('nelstrom/vim-visual-star-search')
  call minpac#add('vim-utils/vim-husk')
  call minpac#add('editorconfig/editorconfig-vim')
  call minpac#add('mhinz/vim-grepper')
  call minpac#add('andymass/vim-matchup')

  " Syntax plugins.
  call minpac#add('elzr/vim-json')
  call minpac#add('chrisbra/csv.vim') " this one is not syntax only
  call minpac#add('vim-scripts/modelica')
  call minpac#add('pboettch/vim-cmake-syntax')
  call minpac#add('tmux-plugins/vim-tmux')
  call minpac#add('https://bitbucket.org/mclab/vim-properties-syntax')
  call minpac#add('pangloss/vim-javascript')
  call minpac#add('othree/javascript-libraries-syntax.vim')
  call minpac#add('mxw/vim-jsx')
  call minpac#add('justinmk/vim-syntax-extra')
  call minpac#add('neovimhaskell/haskell-vim')
  call minpac#add('bohlender/vim-smt2')

  if $DEVMODE
    call minpac#add('darth/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': {-> system('make release')},
    \ })
    call minpac#add('roxma/nvim-yarp')
    call minpac#add('ncm2/ncm2')
    call minpac#add('ncm2/ncm2-ultisnips')
    call minpac#add('sirver/ultisnips')
    call minpac#add('sbdchd/neoformat') " candidate for removal
    call minpac#add('darth/vim-cmake')
    call minpac#add('euclio/vim-markdown-composer', {
    \ 'do': {-> system('cargo build --release')},
    \ })
    call minpac#add('Rykka/riv.vim')
    call minpac#add('Rykka/InstantRst')
    call minpac#add('lervag/vimtex')
  endif
endif

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

filetype plugin indent on
syntax enable
" }}}
" Sessions {{{
set sessionoptions+=tabpages
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
  autocmd BufEnter,FocusGained,InsertLeave *
  \ if !(get(g:, 'GoyoActive', 0) || !buflisted(bufnr(''))) |
  \   set relativenumber |
  \ endif
  autocmd BufLeave,FocusLost,InsertEnter *
  \ if !(get(g:, 'GoyoActive', 0) || !buflisted(bufnr(''))) |
  \   set norelativenumber |
  \ endif
augroup END
" }}}
" Modeline {{{
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
\  '*': 'rcopy',
\ },
\ 'paste': {
\  '+': 'rpaste',
\  '*': 'rpaste',
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
" }}}
" Misc settings {{{
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
set completeopt=noinsert,menuone,noselect
" }}}
" FZF {{{
function! FZF_Files()
  function! s:files()
    let files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_icon(files)
  endfunction

  function! s:prepend_icon(candidates)
    let result = []
    for candidate in a:candidates
      let filename = fnamemodify(candidate, ':p:t')
      let icon = WebDevIconsGetFileTypeSymbol(filename, isdirectory(filename))
      call add(result, printf("%s %s", icon, candidate))
    endfor
    return result
  endfunction

  let wrapped = fzf#wrap('files-devicons', {
  \ 'source': s:files(),
  \ 'options': '-m --preview "cat {2..-1} | head -'.&lines.'"',
  \ 'down':    '40%' })
  " stolen from fzf.vim
  let wrapped.common_sink = remove(wrapped, 'sink*')
  function! wrapped.newsink(lines)
    let lines = extend(a:lines[0:0], map(a:lines[1:], 'get(split(v:val, " "), 1, "")'))
    return self.common_sink(lines)
  endfunction
  let wrapped['sink*'] = remove(wrapped, 'newsink')
  call fzf#run(wrapped)
endfunction
command! Files call FZF_Files()
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>bl :Buffers<CR>
" }}}
" languageclient {{{
if $DEVMODE
  source $HOME/.config/nvim/lc.vim
endif
" }}}
" ultisnips {{{
if $DEVMODE
  inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
  let g:UltiSnipsJumpForwardTrigger = "<c-j>"
  let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
  let g:UltiSnipsRemoveSelectModeMappings = 0
endif
" }}}
" airline {{{
let g:airline_powerline_fonts = 1
let g:airline_theme = 'oceanicnext'
let g:airline_exclude_preview = 0
let g:airline_skip_empty_sections = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#fugitiveline#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#taboo#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tmuxline#enabled = 0
let g:taboo_tabline = 0
" }}}
" tmuxline {{{
let g:tmuxline_preset = {
\   'a': '#S',
\   'win': '#I #W',
\   'cwin': '#I #W',
\   'z': '#h',
\   'options': {
\     'status-justify': 'left'
\   }
\ }
" }}}
" indentline {{{
let g:indentLine_bufTypeExclude = ['help', 'terminal', 'quickfix', 'nofile']
let g:indentLine_char = ''
" }}}
" fugitive {{{
nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gc :Gcommit<CR>
nnoremap <silent> <Leader>gd :Gdiff<CR>
" }}}
" {{{ projectionist
let g:projectionist_ignore_man = 1
" }}}
" latex {{{
let g:tex_flavor = 'latex'
let g:tex_conceal = ''
let g:tex_comment_nospell= 1
let g:latex_fold_enabled = 1
if $DEVMODE
  if has('mac')
    let g:vimtex_view_general_viewer = 'displayline'
    let g:vimtex_view_general_options = '-g -r @line @pdf @tex'
  endif
  let g:vimtex_compiler_latexmk = {'build_dir' : 'build'}
  let g:vimtex_compiler_progname = 'nvr'
  let g:vimtex_quickfix_latexlog = {
  \ 'overfull' : 0,
  \ 'underfull' : 0,
  \ 'packages': {
  \   'hyperref': 0,
  \ },
  \}
endif
" }}}
" {{{ matchup
let g:matchup_override_vimtex = 1
let g:matchup_surround_enabled = 1
" }}}
" gundo {{{
if has('python3')
  let g:gundo_prefer_python3 = 1
endif
nnoremap <Leader>u :GundoToggle<CR>
" }}}
" grepper {{{
let g:grepper = {}
let g:grepper.tools = ['grep', 'git', 'rg']
" Search for the current word
nnoremap <Leader>* :Grepper -cword -noprompt<CR>
" }}}
" markdown {{{
if $DEVMODE
  let g:markdown_composer_autostart = 0
endif
 " }}}
" cmake {{{
let g:cmake_export_compile_commands = 1
" }}}
" jsx {{{
let g:jsx_ext_required = 0
" }}}
" json {{{
let g:vim_json_syntax_conceal = 0
" }}}
" neoformat {{{
let g:neoformat_try_formatprg = 1
" }}}
" Goyo {{{
function! s:goyo_enter()
  let g:GoyoActive = 1
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  set nonumber norelativenumber nolist
  Limelight
endfunction

function! s:goyo_leave()
  let g:GoyoActive = 0
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  set number relativenumber list
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
" }}}
" textobj-entire {{{
let g:textobj_entire_no_default_key_mappings=1
augroup textobj-entire
  autocmd!
  autocmd BufEnter *
  \ call textobj#user#map('entire', {
  \   '-': {
  \     'select-a': 'aE',
  \     'select-i': 'iE',
  \   }
  \ })
augroup END
" }}}
" Autocommands {{{
augroup restore " Restore cursor position.
  autocmd!
  autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
augroup END
" }}}
" quickfix {{{
augroup qf
  autocmd!
  autocmd FileType qf setlocal nobuflisted nonumber norelativenumber colorcolumn= nolist nowrap
  autocmd WinEnter * if winnr('$') == 1 && !buflisted(bufnr('')) | q | endif
augroup END
function! WToggle(type, focus) abort
  function! s:numbufqf() abort
    let all = range(1, bufnr('$'))
    return len(filter(all, 'bufexists(v:val) && getbufvar(v:val, "&bt") == "quickfix"'))
  endfunction
  let nbefore = s:numbufqf()
  if a:type ==# 'quickfix' | silent! cclose | elseif a:type ==# 'location' | silent! lclose | endif
  let nafter = s:numbufqf()
  if nafter == nbefore
    if a:type ==# 'quickfix' | silent! botright copen | elseif a:type ==# 'location' | silent! lopen | endif
    if a:focus
      wincmd p
    endif
  endif
endfunction
nnoremap <silent> <leader>q :call WToggle('quickfix', 0)<CR>
nnoremap <silent> <leader>Q :call WToggle('quickfix', 1)<CR>
nnoremap <silent> <leader>l :call WToggle('location', 0)<CR>
nnoremap <silent> <leader>L :call WToggle('location', 1)<CR>
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
" Toggle invisible symbols
nnoremap <Leader>i :set list!<CR>
" Delete buffer
nnoremap <Leader>bd :bd<CR>
" }}}
" {{{ VISUAL
let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
" }}}
" terminal {{{
function! TToggle(focus) abort
  let perc = 0.3
  let bl = filter(range(1, bufnr('$')), 'bufexists(v:val) && getbufvar(v:val, "&bt") == "terminal" && getbufvar(v:val, "tterm") == 1')
  if len(bl) > 0 " buffer exists
    let wn = bufwinnr(bl[0])
    if wn == -1 " there is no window displaying buffer
      silent! exe string(&lines * perc) . 'split' | exe 'buffer' . bl[0]
      if a:focus " keep focus on the previous window
        wincmd p
      endif
    else
      exe wn . 'wincmd c' 
    endif
  else " buffer does not exist
    silent! exe string(&lines * perc) . 'split' | te
    call setbufvar('', 'tterm', 1)
    set nobuflisted
    nnoremap <buffer> [b <Nop>
    nnoremap <buffer> ]b <Nop>
    if a:focus
      wincmd p
    endif
  endif
endfunction
nnoremap <silent> <leader>t :call TToggle(0)<CR>
nnoremap <silent> <leader>T :call TToggle(1)<CR>
function! TClose() abort
  let bl = filter(range(1, bufnr('$')), 'bufexists(v:val) && getbufvar(v:val, "&bt") == "terminal" && getbufvar(v:val, "tterm") == 1')
  if len(bl) > 0 " buffer exists
    exe 'bdelete! ' . bl[0]
  endif
endfunction
autocmd QuitPre * call TClose()
" }}}
