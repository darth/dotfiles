local function border(x, y, w, h)
  local b = vim.api.nvim_create_buf(false, true)
  local top = '╭' .. string.rep('─', w) .. '╮'
  local mid = "│" .. string.rep(' ', w) .. '│'
  local bot = '╰' .. string.rep('─', w) .. '╯'
  local lines = {}
  table.insert(lines, top)
  for _ = 1, h do table.insert(lines, mid) end
  table.insert(lines, bot)
  vim.api.nvim_buf_set_lines(b, 0, -1, false, lines)
  return vim.api.nvim_open_win(b, false, {
    relative = 'editor',
    col = x - 1,
    row = y - 1,
    width = w + 2,
    height = h + 2,
    style = 'minimal',
    focusable = false
  })
end

local state = {buf = nil, win = {border = nil, term = nil}}

local function close()
  for _, w in ipairs({state.win.term, state.win.border}) do
    vim.api.nvim_set_current_win(w)
    vim.cmd('noautocmd q')
  end
end

local function open(perc, keymap)
  local bufexists = state.buf and vim.fn.bufexists(state.buf) == 1
  local win = -1
  if (bufexists) then
    win = vim.fn.bufwinnr(state.buf)
  else
    state.buf = vim.api.nvim_create_buf(false, false)
  end
  if (win == -1) then
    local width = math.floor(vim.o.columns * perc)
    local col = (vim.o.columns - width) / 2
    local height = math.floor(vim.o.lines * perc)
    local row = (vim.o.lines - height) / 2
    state.win.border = border(col, row, width, height)
    state.win.term = vim.api.nvim_open_win(state.buf, true, {
      relative = 'editor',
      width = width,
      height = height,
      row = row,
      col = col,
      style = 'minimal'
    })
    if (not bufexists) then
      vim.fn.termopen('TT=1 ' .. vim.o.shell)
      if (keymap) then
        vim.api.nvim_buf_set_keymap(state.buf, 'n', keymap,
                                    '<cmd>lua require("terminal").close()<CR>',
                                    {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(state.buf, 't', keymap,
                                    '<cmd>lua require("terminal").close()<CR>',
                                    {noremap = true, silent = true})
      end
    end
    vim.cmd('autocmd! BufLeave <buffer=' .. state.buf ..
                '> :lua require("terminal").close()')
    vim.cmd('startinsert')
  else
    close()
  end
end

return {open = open, close = close}
