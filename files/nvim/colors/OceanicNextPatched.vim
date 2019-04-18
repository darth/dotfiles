hi clear
if exists('syntax on')
  syntax reset
endif

runtime START colors/OceanicNext.vim

let g:colors_name = 'OceanicNextPatched'

" copy-paste from the original theme,
" since there is no access to these script local variables
let s:italic = ''
if g:oceanic_next_terminal_italic == 1
  let s:italic = 'italic'
endif
let s:base0E=['#c594c5', '176']

exec 'hi pythonSelf guifg=' . s:base0E[0] . ' ctermfg=' . s:base0E[1] . ' gui=' . s:italic . ' cterm=' . s:italic
