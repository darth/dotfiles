let s:snip_active = v:false

let g:LanguageClient_serverCommands = {
\ 'c': ['ccls', '--log-file=/tmp/cc.log'],
\ 'cpp': ['ccls', '--log-file=/tmp/cc.log'],
\ 'python': ['pyls'],
\ 'haskell': ['hie', '--lsp'],
\ 'go': ['go-langserver'],
\ 'rust': ['rustup', 'run', 'stable', 'rls'],
\ 'javascript': ['flow-language-server', '--stdio'],
\ 'javascript.jsx': ['flow-language-server', '--stdio'],
\ 'sh': ['bash-language-server', 'start'],
\}

let g:LanguageClient_running = map(copy(g:LanguageClient_serverCommands), {key -> v:false})

let g:LanguageClient_autoStart = 0
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_hasSnippetSupport = 1
let g:LanguageClient_useVirtualText = 1
let g:LanguageClient_diagnosticsList = 'Disabled'
let g:LanguageClient_diagnosticsDisplay = {
\ 1: { 'name': 'Error', 'texthl': 'ALEError', 'signText': '✘', 'signTexthl': 'ALEErrorSign' },
\ 2: { 'name': 'Warning', 'texthl': 'ALEWarning', 'signText': '!', 'signTexthl': 'ALEWarningSign' }
\ }
let g:LanguageClient_rootMarkers = {
\ 'c': ['build'],
\ 'cpp': ['build'],
\ }

function! s:convertdiagentry(fname, entry)
  let severity_types = {
  \ 1: 'E',
  \ 2: 'W',
  \ 3: 'I',
  \ 4: 'H',
  \ }
  return {
  \ 'filename': a:fname,
  \ 'lnum': a:entry['range']['start']['line'] + 1,
  \ 'col': a:entry['range']['start']['character'] + 1,
  \ 'text': a:entry['message'],
  \ 'type': severity_types[a:entry['severity']],
  \ }
endfunction

function! s:convertdiaglist(fname, l)
  let result = deepcopy(a:l)
  call map(result, 's:convertdiagentry(a:fname, v:val)')
  return result
endfunction

function! s:updatediag(state)
  if has_key(a:state, 'result')
    let result = json_decode(a:state.result)
    let s:diagnostics = result.diagnostics
  else
    let s:diagnostics = {}
  endif
  call map(s:diagnostics, {key, val -> s:convertdiaglist(key, val)})
  call s:updateloclists()
endfunction

function! s:updateloclists()
  if s:snip_active isnot v:true
    let awin = bufwinnr('%')
    windo
    \ if &bt ==# '' && &ft !=# '' |
    \   let b:lc_diagnostics = get(s:diagnostics, expand('%:p'), []) |
    \   call setloclist(0, b:lc_diagnostics, 'r', 'LanguageClient') |
    \ endif
    exe awin . 'wincmd w'
  endif
endfunction

function! s:init()
  if get(b:, 'lc_initialized', v:false) is v:false
    let b:lc_initialized = v:true
    setlocal signcolumn=yes
    setlocal formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
    nnoremap <buffer> K :call LanguageClient#textDocument_hover()<CR>
    nnoremap <buffer> gd :call LanguageClient#textDocument_definition()<CR>
    nnoremap <buffer> gr :call LanguageClient#textDocument_references()<CR>
    nnoremap <buffer> gh :call LanguageClient#textDocument_hover()<CR>
    nnoremap <buffer> gs :call LanguageClient#textDocument_documentSymbol()<CR>
    nnoremap <buffer> <F2> :call LanguageClient#textDocument_rename()<CR>
    inoremap <buffer> <c-x><c-o> <c-r>=ncm2#manual_trigger()<cr>
    inoremap <buffer> <silent> <expr> <c-y> ncm2_ultisnips#expand_or("\<c-y>", 'n')
    if &ft ==# 'c' || &ft ==# 'cpp'
      nnoremap <buffer><silent> <c-h>
      \ :call LanguageClient#findLocations({
      \   'method': '$ccls/navigate','direction':'L'
      \ })<CR>
      nnoremap <buffer><silent> <c-j>
      \ :call LanguageClient#findLocations({
      \   'method': '$ccls/navigate','direction':'D'
      \ })<CR>
      nnoremap <buffer><silent> <c-k>
      \ :call LanguageClient#findLocations({
      \   'method': '$ccls/navigate','direction':'U'
      \ })<CR>
      nnoremap <buffer><silent> <c-l>
      \ :call LanguageClient#findLocations({
      \   'method': '$ccls/navigate','direction':'R'
      \ })<CR>
    endif
  endif
  if get(s:, 'forceupdatediag', 0)
    call setloclist(0, get(b:, 'lc_diagnostics', []), 'r', 'LanguageClient')
  endif
endfunction

function! s:deinit()
  if get(b:, 'lc_initialized', v:false) isnot v:false
    let b:lc_initialized = v:false
    setlocal signcolumn=auto
    setlocal formatexpr=''
    nnoremap <buffer> K K
    nnoremap <buffer> gd gd
    nnoremap <buffer> gr <Nop>
    nnoremap <buffer> gh <Nop>
    nnoremap <buffer> gs <Nop>
    nnoremap <buffer> <F2> <F2>
    inoremap <buffer> <c-x><c-o> <c-x><c-o>
    inoremap <buffer> <c-y> <c-y>
    if &ft ==# 'c' || &ft ==# 'cpp'
      nnoremap <buffer><silent> <c-h> <Nop>
      nnoremap <buffer><silent> <c-j> <Nop>
      nnoremap <buffer><silent> <c-k> <Nop>
      nnoremap <buffer><silent> <c-l> <Nop>
    endif
    unlet b:lc_diagnostics
    lclose
  endif
  if &bt ==# '' && &ft !=# ''
    call setloclist(0, [], 'r')
  endif
endfunction

function! s:toggle()
  if g:LanguageClient_running[&ft] is v:true
    call LanguageClient#exit()
    let g:LanguageClient_running[&ft] = v:false
    if &ft ==# 'c' || &ft ==# 'cpp'
      ChromaticaStop
    endif
  else
    call LanguageClient#startServer()
    let g:LanguageClient_running[&ft] = v:true
    if &ft ==# 'c' || &ft ==# 'cpp'
      ChromaticaStart
    endif
  endif
endfunction

command! LanguageClientToggle :call s:toggle()

augroup LanguageClient_config
  autocmd!
  autocmd User LanguageClientStarted silent call s:init()
  autocmd User LanguageClientStopped silent call s:deinit()
  autocmd BufWinEnter,WinEnter *
  \ if has_key(g:LanguageClient_serverCommands, &ft) |
  \   if g:LanguageClient_running[&ft] is v:true |
  \     silent call s:init() |
  \   else |
  \     silent call s:deinit() |
  \   endif |
  \ else |
  \   silent call s:deinit() |
  \ endif
  autocmd BufEnter *
  \ if has_key(g:LanguageClient_serverCommands, &ft) |
  \   call ncm2#enable_for_buffer() |
  \ endif
  autocmd BufLeave *
  \ if &bt !=# '' || &ft ==# '' |
  \   let s:forceupdatediag = 0 |
  \ else |
  \   let s:forceupdatediag = 1 |
  \ endif
  autocmd User LanguageClientDiagnosticsChanged call LanguageClient#getState(function('s:updatediag'))
  autocmd CursorMoved *
  \ if has_key(g:LanguageClient_serverCommands, &ft) && g:LanguageClient_running[&ft] |
  \   silent call LanguageClient#textDocument_documentHighlight() |
  \ endif
  autocmd FileType *
  \ if has_key(g:LanguageClient_serverCommands, &ft) |
  \   nnoremap <buffer> <leader>p :LanguageClientToggle<CR>|
  \ endif
  autocmd User UltiSnipsEnterFirstSnippet let s:snip_active = v:true
  autocmd User UltiSnipsExitLastSnippet let s:snip_active = v:false
augroup END
