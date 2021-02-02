" vim:foldmethod=marker:foldlevel=0
" minpac {{{
if &compatible
  set nocompatible
endif

function! PackInit() abort
  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  call minpac#add('arcticicestudio/nord-vim')

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
  call minpac#add('ryanoasis/vim-devicons')
  call minpac#add('nathanaelkane/vim-indent-guides')

  call minpac#add('sjl/gundo.vim') " candidate for removal
  call minpac#add('schickling/vim-bufonly')
  call minpac#add('qpkorr/vim-bufkill')
  call minpac#add('nelstrom/vim-visual-star-search')
  call minpac#add('vim-utils/vim-husk')
  call minpac#add('editorconfig/editorconfig-vim')
  call minpac#add('mhinz/vim-grepper')
  call minpac#add('andymass/vim-matchup')
  call minpac#add('machakann/vim-highlightedyank')

  " Syntax plugins.
  call minpac#add('elzr/vim-json')
  call minpac#add('chrisbra/csv.vim') " this one is not syntax only
  call minpac#add('vim-scripts/modelica')
  call minpac#add('pboettch/vim-cmake-syntax')
  call minpac#add('tmux-plugins/vim-tmux')
  call minpac#add('https://bitbucket.org/mclab/vim-properties-syntax')
  call minpac#add('othree/javascript-libraries-syntax.vim')
  call minpac#add('yuezk/vim-js')
  call minpac#add('maxmellon/vim-jsx-pretty')
  call minpac#add('alvan/vim-closetag')
  call minpac#add('justinmk/vim-syntax-extra')
  call minpac#add('neovimhaskell/haskell-vim')
  call minpac#add('bohlender/vim-smt2')
  call minpac#add('wannesm/wmnusmv.vim')

  if $DEVMODE
    call minpac#add('neovim/nvim-lspconfig')
    call minpac#add('nvim-lua/completion-nvim')
    call minpac#add('hrsh7th/vim-vsnip')
    call minpac#add('hrsh7th/vim-vsnip-integ')
    call minpac#add('nvim-treesitter/nvim-treesitter')
    call minpac#add('Squareys/vim-cmake')
    call minpac#add('iamcco/markdown-preview.nvim', {
    \ 'do': 'packloadall! | call mkdp#util#install()'
    \ })
    call minpac#add('Rykka/riv.vim')
    call minpac#add('Rykka/InstantRst')
    call minpac#add('lervag/vimtex')
    call minpac#add('lifepillar/pgsql.vim')
    call minpac#add('prettier/vim-prettier')
    call minpac#add('a-vrma/black-nvim')
  endif
endfunction

command! PackUpdate source $MYVIMRC | call PackInit() | call minpac#update()
command! PackClean  source $MYVIMRC | call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call PackInit() | call minpac#status()
" }}}
" Sessions {{{
set sessionoptions+=tabpages,globals
" }}}
" Directories and files {{{
set undofile
" }}}
" Encodings {{{
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
if !has('nvim-0.3.6')
  set nomodeline
endif
" }}}
" Indentation {{{
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set cinoptions=g0:0
" }}}
" Mouse {{{
set mouse=a
" }}}
" Clipboard {{{
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
set inccommand=nosplit
set showmatch
set hlsearch
set gdefault
nnoremap <Leader><Space> :noh<CR>
nnoremap & :&&<CR>
xnoremap & :&&<CR>
" }}}
" Colors {{{
set termguicolors
let g:nord_bold = 1
let g:nord_italic = 1
let g:nord_underline = 1
augroup nord-overrides
  autocmd!
  autocmd ColorScheme nord highlight Comment guifg=#7B88A1 gui=bold
  autocmd ColorScheme nord highlight Folded guifg=#7B88A1
  autocmd ColorScheme nord highlight FoldColumn guifg=#7B88A1
  autocmd ColorScheme nord highlight pythonSelf guifg=#81A1C1 gui=italic " nord9
augroup END
colorscheme nord
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
" python {{{
let g:loaded_python_provider = 0
let g:python3_host_prog = 'python3'
" }}}
" Misc settings {{{
" Make buffer hidden when abandoned.
set hidden
" Improve command line completion.
set wildmenu
set wildmode=list:longest
cnoremap <expr> <C-P> wildmenumode() ? "\<C-P>" : "\<Up>"
cnoremap <expr> <C-N> wildmenumode() ? "\<C-N>" : "\<Down>"
" Specify what backspace can erase.
set backspace=indent,eol,start
" Enable reading man pages.
runtime ftplugin/man.vim
" Enable jumps to matching objects (tags, parentheses, etc).
runtime macros/matchit.vim
" Completion.
set completeopt=noinsert,menuone,noselect
set pumheight=15
" }}}
" FZF {{{
let g:fzf_action = {
\ 'ctrl-r': 'read',
\ 'ctrl-t': 'tab split',
\ 'ctrl-x': 'split',
\ 'ctrl-v': 'vsplit'
\ }
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
  \ 'options': '-m --preview "cat {2..-1} | head -'.&lines.'"' })
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
" airline {{{
let g:airline_powerline_fonts = 1
let g:airline_theme = 'nord'
let g:airline_exclude_preview = 0
let g:airline_skip_empty_sections = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#fugitiveline#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#ignore_bufadd_pat = '!'
let g:airline#extensions#taboo#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#nvimlsp#enabled = 1
let g:taboo_tabline = 0
" }}}
" fugitive {{{
nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gc :Gcommit<CR>
nnoremap <silent> <Leader>gd :Gdiff<CR>
" }}}
" projectionist {{{
let g:projectionist_ignore_man = 1
" }}}
" latex {{{
let g:tex_flavor = 'latex'
let g:tex_conceal = ''
let g:tex_comment_nospell = 1
let g:latex_fold_enabled = 1
" }}}
" matchup {{{
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
let g:grepper.tools = ['rg', 'grep']
" Search for the current word
nnoremap <Leader>* :Grepper -cword -noprompt<CR>
" }}}
" auto-close {{{
let g:closetag_filenames = '*.js'
let g:closetag_xtml_filenames = '*.js'
let g:closetag_close_shortcut = '<leader>>'
" }}}
" json {{{
let g:vim_json_syntax_conceal = 0
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
nnoremap <Leader>bd :BD<CR>
" Paste from register in terminal
tnoremap <expr> <A-r> '<C-\><C-N>"'.nr2char(getchar()).'pi'
" }}}
" VISUAL {{{
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
      else
        startinsert
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
    tnoremap <buffer> <silent> <leader>t <C-\><C-n>:call TToggle(0)<CR>
    if a:focus
      wincmd p
    else
      startinsert
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
" dev {{{
if $DEVMODE
  lua require('lsp')
  lua require('ts')
  " completion.nvim {{{
  let g:completion_enable_snippet = 'vim-vsnip'
  let g:completion_enable_auto_popup = 0
  let g:completion_enable_auto_hover = 0
  let g:completion_confirm_key = "\<C-y>"
  let g:completion_matching_strategy_list = ['fuzzy']
  let g:completion_trigger_on_delete = 1
  imap <C-x><C-o> <cmd>lua require'completion'.triggerCompletion()<CR>
  " }}}
  " vim-vsnip {{{
  imap <expr> <C-j> vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<C-j>'
  smap <expr> <C-j> vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<C-j>'
  imap <expr> <C-k> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<C-k>'
  smap <expr> <C-k> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<C-k>'
  " }}}
  " cmake {{{
  let g:cmake_export_compile_commands = 1
  " }}}
  " vimtex {{{
  if has('mac')
    let g:vimtex_view_method = 'skim'
  endif
  let g:vimtex_compiler_latexmk = {'build_dir' : 'build'}
  let g:vimtex_compiler_progname = 'nvr'
  let g:vimtex_quickfix_ignore_filters = [
  \ 'Package etex Warning',
  \ 'Package hyperref Warning',
  \ 'You have requested package `MCLabPaper',
  \ 'Overfull',
  \ 'Underfull',
  \]
  " }}}
  " black {{{
  command! Black call Black()
  " }}}
  " prettier {{{
  autocmd BufWritePre *.js,*.jsx PrettierAsync
  " }}}
endif
" }}}
" gui {{{
set guifont=FiraCode\ Nerd\ Font\ Mono:h14
let g:neovide_cursor_vfx_mode = 'railgun'
" }}}
