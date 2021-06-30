local augroup = require'my.utils'.augroup

augroup('ScrollbarInit', {
  {'CursorMoved,VimResized,QuitPre', '*', 'silent! lua require("scrollbar").show()'},
  {'WinEnter,FocusGained', '*', 'silent! lua require("scrollbar").show()'},
  {'WinLeave,BufLeave,BufWinLeave,FocusLost', '*', 'silent! lua require("scrollbar").clear()'}
})
